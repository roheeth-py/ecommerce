import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/features/authentication/domain/repositories/auth_repository.dart';

class SignOutUsecase extends UseCase<void, NoParams>{
  SignOutUsecase(this.authRepository);
  final AuthRepository authRepository;
  @override
  Future<Either<Failure, void>> call(NoParams param) async {
    // TODO: implement call
    {
      try {
        await authRepository.signOut();
        return const Right(null);
      }catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }
}

class NoParams {}
