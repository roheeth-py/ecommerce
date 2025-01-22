import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';

abstract class HomeRepo{
  Future<Either<Failure, Map<String, dynamic>>> getProducts();
}