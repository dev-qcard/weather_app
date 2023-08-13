import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/src/presentation/common/common.dart';
import 'package:weather_app/src/presentation/styles/app_colors.dart';
import 'package:weather_app/src/presentation/styles/fonts.dart';
import 'package:weather_app/src/presentation/widgets/email_text_field.dart';
import 'package:weather_app/src/presentation/widgets/helper_button.dart';
import 'package:weather_app/src/presentation/widgets/main_button.dart';
import 'package:weather_app/src/presentation/widgets/password_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Common.topPadding,
          Text(
            'Вход',
            style: Fonts.h1,
          ),
          Common.smallPadding,
          Text(
            'Введите данные для входа',
            style: Fonts.b1.copyWith(
              color: AppColors.grey,
            ),
          ),
          Common.smallPadding,
          Common.smallPadding,
          EmailTextField(controller: emailController),
          Common.smallPadding,
          Common.smallPadding,
          PasswordTextField(controller: passwordController),
          Common.smallPadding,
          Common.smallPadding,
          MainButton(
            text: 'Войти',
            onPressed: () {},
          ),
          Common.smallPadding,
          HelperButton(
            text: 'Нету аккаунта?',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
