import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:library_flutter/core/navigation/navigation.dart';
import 'package:library_flutter/core/theme/theme.dart';
import 'package:library_flutter/features/auth/data/user_repository.dart';
import 'package:library_flutter/features/auth/domain/user_bloc/user_bloc.dart';
import 'package:library_flutter/features/main/data/repositories/book_repository.dart';
import 'package:library_flutter/features/main/data/repositories/category_repository.dart';
import 'package:library_flutter/features/main/data/repositories/reservation_repository.dart';
import 'package:library_flutter/features/main/domain/book_bloc/book_bloc.dart';
import 'package:library_flutter/features/main/domain/category_bloc/category_bloc.dart';
import 'package:library_flutter/features/main/domain/reservation_bloc/reservation_bloc.dart';
import 'package:library_flutter/features/main/data/repositories/feedback_repository.dart';
import 'package:library_flutter/features/main/domain/feedback_bloc/feedback_bloc.dart';
import 'package:library_flutter/features/profile/data/repositories/offer_repository.dart';
import 'package:library_flutter/features/profile/data/repositories/profile_repository.dart';
import 'package:library_flutter/features/profile/domain/offer_bloc/offer_bloc.dart';
import 'package:library_flutter/features/profile/domain/profile_bloc/profile_bloc.dart';
import 'package:library_flutter/features/search/domain/search_bloc/search_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  final preferences = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton(preferences);

  final options = BaseOptions(
    baseUrl: 'http://192.168.50.84/api',
  );
  final dio = Dio(options);
  dio.interceptors.add(
    TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
        printResponseMessage: true,
      ),
    ),
  );
  GetIt.I.registerSingleton(dio);

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
  );

  runApp(const LibraryApp());
}

class LibraryApp extends StatefulWidget {
  const LibraryApp({super.key});

  @override
  State<LibraryApp> createState() => _LibraryAppState();
}

class _LibraryAppState extends State<LibraryApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository(
        dio: GetIt.I<Dio>(), preferences: GetIt.I<SharedPreferences>());
    final bookRepository = BookRepository(dio: GetIt.I<Dio>());
    final resevationRepository = ReservationRepository(dio: GetIt.I<Dio>());
    final feedbackRepository = FeedbackRepository(dio: GetIt.I<Dio>());
    final profileRepository = ProfileRepository(dio: GetIt.I<Dio>());
    final offerRepository = OfferRepository(dio: GetIt.I<Dio>());
    final categoryRepository = CategoryRepository(dio: GetIt.I<Dio>());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => BookBloc(bookRepository: bookRepository),
        ),
        BlocProvider(
          create: (context) => SearchBloc(bookRepository: bookRepository),
        ),
        BlocProvider(
          create: (context) => ReservationBloc(reservationRepository: resevationRepository),
        ),
        BlocProvider(
          create: (context) => FeedbackBloc(feedbackRepository: feedbackRepository),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(profileRepository: profileRepository),
        ),
        BlocProvider(
          create: (context) => OfferBloc(offerRepository: offerRepository),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(categoryRepository: categoryRepository),
        ),
      ],
      child: ToastificationWrapper(
        child: MaterialApp.router(
          title: 'Library',
          debugShowCheckedModeBanner: false,
          theme: themeData,
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}
