part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}

class GetAllCategoriesLoadingState extends StoreState {}

class GetAllCategoriesSuccessState extends StoreState {}

class GetAllCategoriesErrorState extends StoreState {}

class GetAllProductsLoadingState extends StoreState {}

class GetAllProductsSuccessState extends StoreState {}

class GetAllProductsErrorState extends StoreState {}

class SelectCategoryState extends StoreState {}

class GetCategoryProductsLoadingState extends StoreState {}

class GetCategoryProductsSuccessState extends StoreState {}

class GetCategoryProductsErrorState extends StoreState {}