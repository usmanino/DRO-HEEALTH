part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {
  CategoriesLoading();
}

class CategoriesError extends CategoriesState {
  CategoriesError(this.errorMessage);
  final String errorMessage;
}

class CategoriesSuccess extends CategoriesState {
  CategoriesSuccess({required this.categoriseList});
  final List<CategoriesModel> categoriseList;
}
