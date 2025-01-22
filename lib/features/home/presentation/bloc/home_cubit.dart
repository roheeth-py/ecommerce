import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/cart/data/model/product_model.dart';
import 'package:ecommerce/features/home/domain/usecase/get_data_usecase.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetDataUsecase _getDataUsecase;
  HomeCubit(this._getDataUsecase) : super(HomeInitial());

  Future<void> getData() async {
    var data = await _getDataUsecase(NoParams());
    data.fold((failure) {
      emit(HomeFailure(failure.toString()));
    }, (data) {
      List<ProductModel> productModel = data.values.map((element) {
        return ProductModel.fromDatabase(element);
      },).toList();
      print(productModel);
      emit(HomeSuccess(productModel: productModel));
    },);
  }
}
