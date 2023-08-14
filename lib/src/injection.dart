import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/secrets/firebase_options.dart';
import 'package:weather_app/src/core/constants/boxes.dart';
import 'package:weather_app/src/data/datasources/cache_manager/cache_manager.dart';
import 'package:weather_app/src/data/datasources/cache_manager/i_cache_manager.dart';
import 'package:weather_app/src/data/datasources/connection_checker/connection_checker.dart';
import 'package:weather_app/src/data/datasources/connection_checker/i_connection_checker.dart';
import 'package:weather_app/src/data/datasources/weather/i_weather_datasource.dart';
import 'package:weather_app/src/data/datasources/weather/weather_datasource.dart';
import 'package:weather_app/src/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/src/domain/repositories/weather/i_weather_repository.dart';
import 'package:weather_app/src/domain/services/auth/auth_service.dart';
import 'package:weather_app/src/domain/services/auth/i_auth_service.dart';
import 'package:weather_app/src/domain/usecases/auth/sign_in.dart';
import 'package:weather_app/src/domain/usecases/auth/sign_out.dart';
import 'package:weather_app/src/domain/usecases/auth/sign_up.dart';
import 'package:weather_app/src/domain/usecases/weather/load_weather.dart';
import 'package:weather_app/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:weather_app/src/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:weather_app/src/presentation/bloc/weather/weather_bloc.dart';

final sl = GetIt.I;

Future<void> init() async {
  //* FLUTTER-SPECIFIC
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  // await FirebaseAuth.instance.signOut();

  //* EXTERNAL
  // Firebase
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  // Hive
  final box = await Hive.openBox(Boxes.weatherBox);
  sl.registerSingleton<Box>(box);

  // Connection checker
  sl.registerSingleton<InternetConnectionChecker>(InternetConnectionChecker());

  // Dio
  sl.registerSingleton<Dio>(Dio());

  //* DATA LAYER
  // Datasources
  sl.registerSingleton<IConnectionChecker>(ConnectionChecker(internetConnectionChecker: sl()));
  sl.registerSingleton<ICacheManager>(CacheManager(database: sl()));
  sl.registerSingleton<IWeatherDatasource>(WeatherDatasource(client: sl()));

  // Repositories
  sl.registerSingleton<IWeatherRepository>(
    WeatherRepository(
      cacheManager: sl(),
      connectionChecker: sl(),
      weatherDatasource: sl(),
    ),
  );

  //* DOMAIN LAYER
  // Services
  sl.registerSingleton<IAuthService>(AuthService(authClient: sl()));

  // Usecases
  sl.registerSingleton<SignIn>(SignIn(authService: sl()));
  sl.registerSingleton<SignUp>(SignUp(authService: sl()));
  sl.registerSingleton<SignOut>(SignOut(authService: sl()));
  sl.registerSingleton<LoadWeather>(LoadWeather(weatherRepository: sl()));

  //* PRESENTATION LAYER
  // BLoCs
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      signIn: sl(),
      signUp: sl(),
      signOut: sl(),
    ),
  );
  sl.registerFactory<NavigationBloc>(
    () => NavigationBloc(),
  );
  sl.registerFactory<WeatherBloc>(
    () => WeatherBloc(
      loadWeather: sl(),
    ),
  );
}
