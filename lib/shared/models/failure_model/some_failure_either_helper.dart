import 'package:dartz/dartz.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';

Either<SomeFailure, T> eitherHelper<T>(
  Either<SomeFailure, T> Function() right, {
  required String methodName,
  required String className,
  String? data,
  ErrorLevelEnum? errorLevel,
  User? user,
}) {
  try {
    return right();
  } catch (e, stack) {
    return Left(
      SomeFailure.value(
        error: e,
        stack: stack,
        user: user,
        tag: methodName,
        tagKey: className,
      ),
    );
  }
}

Future<Either<SomeFailure, T>> eitherFutureHelper<T>(
  Future<Either<SomeFailure, T>> Function() function, {
  required String methodName,
  required String className,
  String? data,
  ErrorLevelEnum? errorLevel,
  User? user,
  void Function()? finallyFunction,
}) async {
  try {
    return await function();
  } catch (e, stack) {
    return Left(
      SomeFailure.value(
        error: e,
        stack: stack,
        user: user,
        tag: methodName,
        tagKey: className,
      ),
    );
  } finally {
    finallyFunction?.call();
  }
}

T valueErrorHelper<T>(
  T Function() right, {
  required T failureValue,
  required String? methodName,
  required String? className,
  String? data,
  ErrorLevelEnum? errorLevel,
  User? user,
}) {
  try {
    return right();
  } catch (e, stack) {
    if (className != null) {
      SomeFailure.value(
        error: e,
        stack: stack,
        user: user,
        tag: methodName,
        tagKey: className,
      );
    }
    return failureValue;
  }
}

Future<T> valueFutureErrorHelper<T>(
  Future<T> Function() right, {
  required T failureValue,
  required String methodName,
  required String className,
  String? data,
  ErrorLevelEnum? errorLevel,
  User? user,
}) async {
  try {
    return await right();
  } catch (e, stack) {
    SomeFailure.value(
      error: e,
      stack: stack,
      user: user,
      tag: methodName,
      tagKey: className,
    );
    return failureValue;
  }
}
