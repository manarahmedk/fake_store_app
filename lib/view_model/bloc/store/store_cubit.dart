import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/view_model/data/network/dio_helper.dart';
import 'package:store_app/view_model/data/network/end_points.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

  static StoreCubit get(context) => BlocProvider.of<StoreCubit>(context);

  List<String> categories=[];

  int selectedCategoryIndex=0;

  void selectCategory(int index){
    selectedCategoryIndex=index;
    emit(SelectCategoryState());
  }


  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoadingState());
    await DioHelper.get(endPoint: "${EndPoints.products}/${EndPoints.categories}").then((value){
      print(value?.data);
      if(value?.data !=null){
        categories= value?.data.cast<String>();
      }
      emit(GetAllCategoriesSuccessState());
    }).catchError((error){
      print(error);
      emit(GetAllCategoriesErrorState());
      throw error;
    });
  }

  List<Product> products=[];

  Future<void> getAllProducts() async {
    emit(GetAllProductsLoadingState());
    await DioHelper.get(endPoint: EndPoints.products).then((value){
      //print(value?.data);
      log(jsonEncode(value?.data));
      products.clear();
      for(var i in value?.data){
        products.add(Product.fromJson(i));
      }
      emit(GetAllProductsSuccessState());
    }).catchError((error){
      print(error);
      emit(GetAllProductsErrorState());
    });
  }

  List<Product> categoryProducts=[];

  Future<void> getCategoryProducts() async {
    emit(GetCategoryProductsLoadingState());
    await DioHelper.get(endPoint: "${EndPoints.products}/${EndPoints.category}/${categories[selectedCategoryIndex]}").then((value){
      print(value?.data);
      log(jsonEncode(value?.data));
      categoryProducts.clear();
      for(var i in value?.data){
        categoryProducts.add(Product.fromJson(i));
      }
      emit(GetCategoryProductsSuccessState());
    }).catchError((error){
      print(error);
      emit(GetCategoryProductsErrorState());
      throw error;
    });
  }

}
