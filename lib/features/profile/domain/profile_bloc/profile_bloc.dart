import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_flutter/features/profile/data/models/profile.dart';
import 'package:library_flutter/features/profile/data/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(ProfileInitial()) {
    on<LoadProfile>(_load);
  }

  final ProfileRepository _profileRepository;

  Future<void> _load(event, emit) async {
    try {
      if (state is! ProfileLoaded) {
        emit(ProfileLoading());
      }
      final profile = await _profileRepository.getProfile();
      emit(ProfileLoaded(profile: profile));
    } catch (e) {
      emit(ProfileLoadingFailure(exception: e));
    }
  }
}
