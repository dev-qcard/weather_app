import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:weather_app/src/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:weather_app/src/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_app/src/presentation/common/common.dart';
import 'package:weather_app/src/presentation/styles/fonts.dart';
import 'package:weather_app/src/presentation/widgets/loading_weather_indicator.dart';
import 'package:weather_app/src/presentation/widgets/weather_chip.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  int _currentChip = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: const Color.fromARGB(255, 28, 22, 204).withAlpha(250),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: const Color.fromARGB(255, 11, 11, 61),
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              transform: const GradientRotation(
                1.3,
              ),
              colors: [
                const Color.fromARGB(255, 24, 18, 198).withAlpha(250),
                const Color.fromARGB(255, 11, 11, 61),
              ],
            ),
          ),
        ),
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const LoadingWeatherIndicator();
            } else if (state is WeatherError) {
              return Center(
                child: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: Fonts.b2.copyWith(
                    color: Colors.white,
                  ),
                ),
              );
            } else if (state is WeatherLoaded) {
              final data = state.weather[_currentChip];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Common.smallPadding,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.gps_fixed,
                                color: Colors.white,
                              ),
                              Common.horizontalDivider,
                              Text(
                                '${data.city}, ${data.country}',
                                style: Fonts.b2.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(const SignOutEvent());
                              BlocProvider.of<NavigationBloc>(context).add(const SignInPageEvent());
                            },
                            icon: const Icon(Icons.logout),
                            color: Colors.white,
                            splashRadius: 20,
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/images/backimage.png'),
                          data.weatherImage,
                        ],
                      ),
                      Text(
                        '${data.temperature.toInt()}°',
                        style: Fonts.h1.copyWith(
                          fontSize: 64,
                          color: Colors.white,
                        ),
                      ),
                      Common.verticalDivider,
                      Text(
                        data.verboseWeather,
                        style: Fonts.b1.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Common.verticalDivider,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Макс. ${data.maxTemperature.toInt()}°',
                            style: Fonts.b1.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Common.horizontalDivider,
                          Text(
                            'Мин. ${data.minTemperature.toInt()}°',
                            style: Fonts.b1.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Common.verticalDivider,
                      Common.verticalDivider,
                      Common.verticalDivider,
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(40),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Сегодня',
                                    style: Fonts.b2.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${DateTime.now().day} ${DateFormat("MMMM").format(DateTime.now())}',
                                    style: Fonts.b2.copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                            Expanded(
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Common.horizontalDivider,
                                  WeatherChip(
                                    icon: state.weather[0].weatherIcon,
                                    onTap: () {
                                      setState(() {
                                        _currentChip = 0;
                                      });
                                    },
                                    temperature: '${state.weather[0].temperature.toInt()}°',
                                    time: DateFormat("HH:mm").format(state.weather[0].dateTime),
                                    isActive: _currentChip == 0,
                                  ),
                                  Common.horizontalDivider,
                                  WeatherChip(
                                    icon: state.weather[1].weatherIcon,
                                    onTap: () {
                                      setState(() {
                                        _currentChip = 1;
                                      });
                                    },
                                    temperature: '${state.weather[1].temperature.toInt()}°',
                                    time: DateFormat("HH:mm").format(state.weather[1].dateTime),
                                    isActive: _currentChip == 1,
                                  ),
                                  Common.horizontalDivider,
                                  WeatherChip(
                                    icon: state.weather[2].weatherIcon,
                                    onTap: () {
                                      setState(() {
                                        _currentChip = 2;
                                      });
                                    },
                                    temperature: '${state.weather[2].temperature.toInt()}°',
                                    time: DateFormat("HH:mm").format(state.weather[2].dateTime),
                                    isActive: _currentChip == 2,
                                  ),
                                  Common.horizontalDivider,
                                  WeatherChip(
                                    icon: state.weather[3].weatherIcon,
                                    onTap: () {
                                      setState(() {
                                        _currentChip = 3;
                                      });
                                    },
                                    temperature: '${state.weather[3].temperature.toInt()}°',
                                    time: DateFormat("HH:mm").format(state.weather[3].dateTime),
                                    isActive: _currentChip == 3,
                                  ),
                                  Common.horizontalDivider,
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Common.verticalDivider,
                      Common.verticalDivider,
                      Common.verticalDivider,
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(40),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.wind_power,
                                        color: Colors.white,
                                      ),
                                      Common.horizontalDivider,
                                      Text(
                                        '${data.windSpeed.toInt()} м/с',
                                        style: Fonts.b2.copyWith(
                                          fontSize: 20,
                                          color: Colors.white.withAlpha(100),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Common.horizontalDivider,
                                  Common.horizontalDivider,
                                  Common.horizontalDivider,
                                  Text(
                                    data.verboseWindDirection,
                                    style: Fonts.b2.copyWith(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.water,
                                        color: Colors.white,
                                      ),
                                      Common.horizontalDivider,
                                      Text(
                                        '${data.humidity.toInt()}%',
                                        style: Fonts.b2.copyWith(
                                          fontSize: 20,
                                          color: Colors.white.withAlpha(100),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Common.horizontalDivider,
                                  Common.horizontalDivider,
                                  Common.horizontalDivider,
                                  Text(
                                    data.verboseHumidity,
                                    style: Fonts.b2.copyWith(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Common.verticalDivider,
                    ],
                  ),
                ),
              );
            }
            return const LoadingWeatherIndicator();
          },
        ),
      ],
    );
  }
}
