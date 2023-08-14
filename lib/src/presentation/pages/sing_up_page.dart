import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:weather_app/src/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:weather_app/src/presentation/common/common.dart';
import 'package:weather_app/src/presentation/styles/app_colors.dart';
import 'package:weather_app/src/presentation/styles/fonts.dart';
import 'package:weather_app/src/presentation/widgets/email_text_field.dart';
import 'package:weather_app/src/presentation/widgets/helper_button.dart';
import 'package:weather_app/src/presentation/widgets/loading_indicatior.dart';
import 'package:weather_app/src/presentation/widgets/main_button.dart';
import 'package:weather_app/src/presentation/widgets/password_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return const LoadingIndicator();
            },
          );
        } else if (state is AuthSuccess) {
          Navigator.pop(context);
          BlocProvider.of<NavigationBloc>(context).add(
            const WeatherPageEvent(),
          );
        } else if (state is AuthError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: AppColors.blue,
              content: Text(
                state.errorMessage,
                style: Fonts.b1.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Common.topPadding,
            Text(
              'Регистрация',
              style: Fonts.h1,
            ),
            Common.smallPadding,
            Text(
              'Введите данные для регистрации',
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
              text: 'Зарегестрироваться',
              onPressed: () {
                if (emailController.text.isEmpty || passwordController.text.isEmpty) return;
                BlocProvider.of<AuthBloc>(context).add(
                  SignUpEvent(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
              },
            ),
            Common.smallPadding,
            HelperButton(
              text: 'Есть аккаунт?',
              onPressed: () {
                BlocProvider.of<NavigationBloc>(context).add(
                  const SignInPageEvent(),
                );
              },
            ),
          ],
        ),
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
