import 'package:store_application/model/address.dart';
import 'package:store_application/model/category.dart';
import 'package:store_application/model/product.dart';

abstract class ProductsStates {}

class InitialState extends ProductsStates {}

class SuccessState extends ProductsStates {
  List<Product>? products;
  List<Category>? categories;
  SuccessState({ this.products, this.categories, Address? address});
}

class FailureState extends ProductsStates {}

class LoadingState extends ProductsStates {}
