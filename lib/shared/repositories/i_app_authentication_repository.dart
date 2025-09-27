import 'package:dartz/dartz.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';

abstract class IAppAuthenticationRepository {
  Stream<User> get user;
  Stream<UserSetting> userSetting(String userId);

  User get currentUser;
  UserSetting get currentUserSetting;

  Future<Either<SomeFailure, User?>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<SomeFailure, User?>> signUp({
    required String email,
    required String password,
  });

  Future<Either<SomeFailure, bool>> logOut();

  Future<Either<SomeFailure, bool>> deleteUser();

  Future<Either<SomeFailure, UserSetting>> updateUserSetting(
    UserSetting userSetting,
  );
}
