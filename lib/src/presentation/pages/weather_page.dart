import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/src/presentation/common/common.dart';
import 'package:weather_app/src/presentation/styles/fonts.dart';
import 'package:weather_app/src/presentation/widgets/weather_chip.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Common.smallPadding,
                Row(
                  children: [
                    const Icon(
                      Icons.gps_fixed,
                      color: Colors.white,
                    ),
                    Common.horizontalDivider,
                    Text(
                      'Архангельск, Россия',
                      style: Fonts.b2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/backimage.png'),
                    Image.asset('assets/images/thunder.png'),
                  ],
                ),
                Text(
                  '28°',
                  style: Fonts.h1.copyWith(
                    fontSize: 64,
                    color: Colors.white,
                  ),
                ),
                Common.verticalDivider,
                Text(
                  'Гроза',
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
                      'Макс. 29°',
                      style: Fonts.b1.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Common.horizontalDivider,
                    Text(
                      'Мин. 27°',
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
                              '20 марта',
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
                              icon: Image.asset('assets/icons/cloudy_icon.png'),
                              onTap: () {},
                              temperature: '27°',
                              time: '14:00',
                              isActive: false,
                            ),
                            Common.horizontalDivider,
                            WeatherChip(
                              icon: Image.asset('assets/icons/cloudy_icon.png'),
                              onTap: () {},
                              temperature: '27°',
                              time: '14:00',
                              isActive: true,
                            ),
                            Common.horizontalDivider,
                            WeatherChip(
                              icon: Image.asset('assets/icons/cloudy_icon.png'),
                              onTap: () {},
                              temperature: '27°',
                              time: '14:00',
                              isActive: false,
                            ),
                            Common.horizontalDivider,
                            WeatherChip(
                              icon: Image.asset('assets/icons/cloudy_icon.png'),
                              onTap: () {},
                              temperature: '27°',
                              time: '14:00',
                              isActive: false,
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
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.wind_power,
                                  color: Colors.white,
                                ),
                                Common.horizontalDivider,
                                Text(
                                  '2 м/с',
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
                              'Ветер северо-восточный',
                              style: Fonts.b2.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.water,
                                  color: Colors.white,
                                ),
                                Common.horizontalDivider,
                                Text(
                                  '100%',
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
                              'Высокая влажность',
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
        ),
      ],
    );
  }
}
