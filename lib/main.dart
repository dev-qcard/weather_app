import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/injection.dart';
import 'package:weather_app/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:weather_app/src/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:weather_app/src/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_app/src/presentation/pages/sign_in_page.dart';
import 'package:weather_app/src/presentation/pages/sing_up_page.dart';
import 'package:weather_app/src/presentation/pages/weather_page.dart';
import 'package:weather_app/src/presentation/widgets/loading_indicatior.dart';

Future<void> main() async {
  await init();

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (context) => sl()..add(const AutoSignInEvent()),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => sl(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather app by Ivan Orlovskiy',
        home: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: BlocBuilder<NavigationBloc, NavigationState>(
                builder: (context, state) {
                  if (state is NavigationLoading) {
                    return const LoadingIndicator();
                  } else if (state is NavigationSignIn) {
                    return BlocProvider<AuthBloc>(
                      create: (context) => sl(),
                      child: const SignInPage(),
                    );
                  } else if (state is NavigationSignUp) {
                    return BlocProvider<AuthBloc>(
                      create: (context) => sl(),
                      child: const SignUpPage(),
                    );
                  } else if (state is NavigationWeather) {
                    return BlocProvider<WeatherBloc>(
                      create: (context) => sl()
                        ..add(
                          const LoadWeatherEvent(),
                        ),
                      child: const WeatherPage(),
                    );
                  }
                  return const SignInPage();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
