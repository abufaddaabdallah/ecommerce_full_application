import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_application/model/category.dart';
import 'package:store_application/model/product.dart';

import '../../controllers/category_controller.dart';
import '../../controllers/product_controller.dart';
import '../../model/address.dart';
import 'products_events.dart';
import 'products_states.dart';

class ProductsBloc extends Bloc<ProductsEvents, ProductsStates>
    with ChangeNotifier {
  int cartItemCount = 0;
  List<Product>? products;
  List<Category>? categories;
  int id = 1;
  List<Product>? selectedProducts = [];
  String createdAt = "";
  double total = 0;
  double taxAmount = 0;
  double subTotal = 0;
  Address address=Address() ;
  GlobalKey keyForm = GlobalKey<FormState>();
  int paymentMethod = 1;

  ProductsBloc() : super(InitialState()) {
    on<UpdateAddressEvent>(_updateAddress);
    on<GenerateTotalEvent>(generateTotalEvent);
    on<GetCartItemCount>(getCartItemCount);
    on<GetProductsEvent>(_getProducts);
    on<GetProductsByCategoryEvent>(_getProductsByCategory);
    on<GetCategoriesEvent>(_getCategories);
    on<GetCategoryByIdEvent>(_getCategoryById);
    on<AddToCartEvent>(addToCart);
    // on<GetCategoryNameEvent>(getCategoryNameBloc);
    on<UpdateQtyEvent>(updateQtyBloc);
    on<RemoveProductEvent>(removeProduct);
    on<UpdatePaymentMethodEvent>(updatePaymentMethodBloc);
  }
  FutureOr<void> _getCategories(
      GetCategoriesEvent event, Emitter<ProductsStates> emit) async {
    try {
      emit(LoadingState());
      categories = await CategoryController().getAll();
      // print("Categories Fetched:  $categories");
      emit(SuccessState(products: products!,  categories: categories!));
    } catch (ex) {
      print(ex);
      emit(FailureState());
    }
  }
  FutureOr<void> _getProducts(
      GetProductsEvent event, Emitter<ProductsStates> emit) async {
    try {
      emit(LoadingState());
      products = await ProductController().getAll();
      print("Products Fetched");
      emit(SuccessState(products: products!,categories: categories!));
    } catch (ex) {
      print(ex);
      emit(FailureState());
    }
  }
  FutureOr<void> _getProductsByCategory(
      GetProductsByCategoryEvent event, Emitter<ProductsStates> emit) async {
    try {
      emit(LoadingState());
      products = await ProductController().getProductByCategoryId(event.categoryId);
      print("Products By Category Fetched");
      emit(SuccessState(products: products!,categories: categories!));
    } catch (ex) {
      print(ex);
      emit(FailureState());
    }
  }

  String getCategoryName(int categoryId) {
    Category? category = categories!.firstWhere(
        (category) => category.id == categoryId,
        orElse: () => Category(0, "Unknown", "Icons.error_outline"));
    return category.name;
  }

  Future<String?>? getCategoryNameBloc(
      GetCategoryNameEvent event, Emitter<ProductsStates> emit) async {
    try {
      emit(LoadingState());
      Category? category = categories!.firstWhere(
          (category) => category.id == event.categoryId,
          orElse: () => Category(0, "Unknown", "Icons.error_outline"));
      emit(SuccessState());
      return category.name;
    } catch (ex) {
      print(ex);
      emit(FailureState());
    }
    emit(SuccessState());
    return null;
  }

  FutureOr<void> generateTotalEvent(
      GenerateTotalEvent event, Emitter<ProductsStates> emit) {
    total = 0;
    subTotal = 0;
    taxAmount = 0;
    for (Product product in selectedProducts!) {
      subTotal += product.subTotal;
      taxAmount += product.taxAmount;
      total += product.total;
    }
    emit(SuccessState(products: products!));
  }
  FutureOr<void> getCartItemCount(
      GetCartItemCount event, Emitter<ProductsStates> emit) {
    cartItemCount = event.cartItemCount;
    emit(SuccessState());
  }

  FutureOr<void> addToCart(AddToCartEvent event, Emitter<ProductsStates> emit) {
    // Product product = products![event.product];
    selectedProducts?.add(event.product);
    generateTotal();
    emit(SuccessState(products: products!,categories: categories!));
  }

  FutureOr<void> removeProduct(
      RemoveProductEvent event, Emitter<ProductsStates> emit) {
    selectedProducts?.removeAt(event.index);
    emit(SuccessState(products: products!));
  }

  generateTotal() {
    total = 0;
    subTotal = 0;
    taxAmount = 0;
    for (Product product in selectedProducts!) {
      subTotal += product.subTotal;
      taxAmount += product.taxAmount;
      total += product.total;
    }
  }

  updateQty(Product product, int newQty) {
    product.selectedQty = newQty;
    generateTotal();
    notifyListeners();
  }

  FutureOr<void> _updateAddress(
      UpdateAddressEvent event, Emitter<ProductsStates> emit)async {
    address = event.address;
    emit(SuccessState(address:address));
  }

  updateAddress(Address newAddress) async{
     address =  newAddress;
    print(address);
    return  address;
  }

  updatePaymentMethod(int newId) {
    paymentMethod = newId;
    notifyListeners();
  }

  FutureOr<void> updatePaymentMethodBloc(
      UpdatePaymentMethodEvent event, Emitter<ProductsStates> emit) {
    paymentMethod = event.newId;
    notifyListeners();
    emit(SuccessState(products: products!));
  }

  // addToCart2(Product product) {
  //   selectedProducts.add(product);
  //   generateTotal();
  //   notifyListeners();
  // }

  FutureOr<void> updateQtyBloc(
      UpdateQtyEvent event, Emitter<ProductsStates> emit) {
    event.product.selectedQty = event.newQty;
    print("newQty${event.newQty}");
    generateTotal();
    notifyListeners();
    emit(SuccessState(products: products!));
  }

  Future<FutureOr<void>> _getCategoryById(GetCategoryByIdEvent event, Emitter<ProductsStates> emit) async {
    try {
      emit(LoadingState());
      categories = await CategoryController().getById();
      print("Category 1 Fetched");
      emit(SuccessState(categories: categories!));
    } catch (ex) {
      print(ex);
      emit(FailureState());
    }
  }
}
//   generateTotal() {
//   total = 0;
//   subTotal = 0;
//   taxAmount = 0;
//   for (Product product in selectedProducts) {
//     subTotal += product.subTotal;
//     taxAmount += product.taxAmount;
//     total += product.total;
//   }
// }
//
// addToCart(Product product) {
//   selectedProducts.add(product);
//   generateTotal();
//   // notifyListeners();
// }
//

// FutureOr<void> _getCategories(
//     GetProductsEvent event, Emitter<ProductsStates> emit) async {
//   try {
//     emit(LoadingState());
//     categories = await CategoryController().getAll();
//     print("Categories Fetched");
//     emit(SuccessState(categories: categories!));
//   } catch (ex) {
//     print(ex);
//     emit(FailureState());
//   }
// }

// try {
//   emit(LoadingState());
//   categories = await CategoryController().getAll();
//   print("Categories Fetched");
//   emit(SuccessState(categories: categories!));
// } catch (ex) {
//   print(ex);
//   emit(FailureState());
// }
