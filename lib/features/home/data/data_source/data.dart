import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/failure.dart';

abstract class FirebaseDataSource{
  Future<Either<Failure, Map<String, dynamic>>> getData();
}

abstract class LocationService{
  Future<Loca>
}

enum ProductCategory {
  Diary_and_Daily,
  Stationery,
  School_items,
  Snacks,
  Chocolates,
  Ice_Creams,
  Stickers,
  Other,
}
