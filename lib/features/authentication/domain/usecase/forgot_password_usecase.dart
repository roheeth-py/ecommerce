import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/features/authentication/domain/repositories/auth_repository.dart';

class ForgotPasswordUsecase extends UseCase<void, String> {
  final AuthRepository _authRepository;
  ForgotPasswordUsecase(this._authRepository);

  @override
  Future<Either<Failure, String>> call(String param) async {
    // TODO: implement call
    try {
      await _authRepository.forgetPassword(param);
      return const Right("Success");
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
