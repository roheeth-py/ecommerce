part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeSuccess extends HomeState {
  final List<ProductModel> productModel;

  HomeSuccess({required this.productModel});
}
final class HomeFailure extends HomeState {
  HomeFailure(this.error);
  final String error;
}
