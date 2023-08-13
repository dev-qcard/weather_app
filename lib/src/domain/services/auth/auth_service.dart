// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/src/core/failures/auth/email_in_use_failure.dart';
import 'package:weather_app/src/core/failures/auth/invalid_email_failure.dart';
import 'package:weather_app/src/core/failures/auth/user_disabled_failure.dart';
import 'package:weather_app/src/core/failures/auth/user_not_found_failure.dart';
import 'package:weather_app/src/core/failures/auth/weak_password_failure.dart';
import 'package:weather_app/src/core/failures/auth/wrong_password_failure.dart';
import 'package:weather_app/src/core/failures/common/api_problem.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/success/success.dart';
import 'package:weather_app/src/domain/entities/user/user_data.dart';
import 'package:weather_app/src/domain/services/auth/i_auth_service.dart';

class AuthService implements IAuthService {
  final FirebaseAuth authClient;

  AuthService({
    required this.authClient,
  });

  @override
  Future<Either<Failure, Success>> signIn(UserData userData) async {
    try {
      await authClient.signInWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );
      return const Right(Success());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return const Left(WrongPasswordFailure());
      } else if (e.code == 'user-disabled') {
        return const Left(UserDisabledFailure());
      } else if (e.code == 'invalid-email') {
        return const Left(InvalidEmailFailure());
      } else if (e.code == 'user-not-found') {
        return const Left(UserNotFoundFailure());
      } else {
        return const Left(ApiProblemFailure());
      }
    } catch (_) {
      return const Left(ApiProblemFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> signUp(UserData userData) async {
    try {
      await authClient.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );
      return const Right(Success());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left(WeakPasswordFailure());
      } else if (e.code == 'email-already-in-use') {
        return const Left(EmailInUseFailure());
      } else if (e.code == 'invalid-email') {
        return const Left(InvalidEmailFailure());
      } else {
        return const Left(ApiProblemFailure());
      }
    } catch (_) {
      return const Left(ApiProblemFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> signOut() async {
    try {
      await authClient.signOut();
      return const Right(Success());
    } catch (_) {
      return const Left(ApiProblemFailure());
    }
  }
}
