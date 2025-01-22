import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';
import 'package:ecommerce/features/home/data/data_source/data.dart';
import 'package:ecommerce/features/home/data/data_source/data_impl.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({required this.firebaseDataSource});

  final FirebaseDataSource firebaseDataSource;

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProducts() async {
    // TODO: implement getProducts
    return await firebaseDataSource.getData();
  }
}
