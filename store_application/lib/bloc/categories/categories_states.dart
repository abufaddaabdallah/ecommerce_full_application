import 'package:store_application/model/category.dart';

abstract class CategoriesStates {}

class InitialState extends CategoriesStates {}

class SuccessState extends CategoriesStates {
  List<Category>? categories;

  SuccessState({this.categories});
}

class FailureState extends CategoriesStates {}

class LoadingState extends CategoriesStates {}

// Get All success
// Error/Failure
// Loading
