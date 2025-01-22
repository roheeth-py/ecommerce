import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';
import 'package:ecommerce/features/home/data/data_source/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class FirebaseDataSourceImpl implements FirebaseDataSource {
  final sl = GetIt.instance<Dio>();
  @override
  Future<Either<Failure, Map<String, dynamic>>> getData() async {
    // TODO: implement getData
    try {
      Response response = await sl.get("/products.json");
      if (response.statusCode == HttpStatus.ok) {
        return Right(response.data);
      } else {
        return Left(ServerFailure(message: "Unable to fetch data"));
      }
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } on DioException catch (e) {
      return Left(ServerFailure(message: "Dio error: ${e.message}"));
    } on Exception catch (e) {
      return Left(ServerFailure(message: "Unexpected error: $e"));
    }
  }
}
