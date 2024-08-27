import 'package:dio/dio.dart';
import 'package:library_flutter/features/profile/data/models/profile.dart';

class ProfileRepository {
  ProfileRepository({required this.dio});

  final Dio dio;

  Future<Profile> getProfile() async {
    final response = await dio.get('/profile/');
    final data = response.data as Map<String, dynamic>;
    final profile = Profile.fromMap(data);
    return profile;
  }
}
