import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:library_flutter/features/auth/domain/user_bloc/user_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({required this.context});

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  final BuildContext context;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (err.requestOptions.path == '/api/token/refresh/') {
        return handler.next(err);
      }
      try {
        String token = await _refreshToken();
        err.requestOptions.headers['Authorization'] = 'Bearer $token';
      } catch (e) {
        context.read<UserBloc>().add(LogoutUser());
        return handler.next(err);
      }

      return handler.resolve(await GetIt.I<Dio>().fetch(err.requestOptions));
    }
    return handler.next(err);
  }

  Future<String> _refreshToken() async {
    final token = await _getRefreshToken();
    final response =
        await GetIt.I<Dio>().post('/token/refresh/', data: {'refresh': token});
    final data = response.data as Map<String, dynamic>;
    _setAccessToken(data['access']);
    return data['access'];
  }

  Future<void> _setAccessToken(String token) async {
    await GetIt.I<SharedPreferences>().setString(_accessTokenKey, token);
  }

  Future<String?> _getAccessToken() async {
    final token = GetIt.I<SharedPreferences>().getString(_accessTokenKey);
    return token;
  }

  Future<String?> _getRefreshToken() async {
    final token = GetIt.I<SharedPreferences>().getString(_refreshTokenKey);
    return token;
  }
}
