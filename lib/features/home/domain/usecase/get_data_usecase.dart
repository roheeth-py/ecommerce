import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repo.dart';

class GetDataUsecase implements UseCase<Map<String, dynamic>, NoParams>{
  final HomeRepo homeRepo;

  GetDataUsecase({required this.homeRepo});
  @override
  Future<Either<Failure, Map<String, dynamic>>> call(NoParams params) {
    // TODO: implement call
    return homeRepo.getProducts();
  }
}

class NoParams {}