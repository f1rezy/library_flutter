import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  UserRepository({required this.dio, required this.preferences});

  final Dio dio;
  final SharedPreferences preferences;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  Future<void> login(String username, String password) async {
    final response = await dio
        .post('/token/', data: {'username': username, 'password': password});
    final data = response.data as Map<String, dynamic>;
    await _setAccessToken(data['access']);
    await _setRefreshToken(data['refresh']);
  }

  Future<void> _setAccessToken(String token) async {
    await preferences.setString(_accessTokenKey, token);
  }

  Future<void> _setRefreshToken(String token) async {
    await preferences.setString(_refreshTokenKey, token);
  }
}
