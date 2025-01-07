import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';

abstract class UseCase<Type, Param>{
  Future<Either<Failure, Type>> call(Param param);
}