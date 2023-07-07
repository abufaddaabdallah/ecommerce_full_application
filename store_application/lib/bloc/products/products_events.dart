import '../../model/address.dart';
import '../../model/product.dart';

abstract class ProductsEvents {}

abstract class CategoriesEvent {}

class GetProductsEvent extends ProductsEvents {}

class GetProductsByCategoryEvent extends ProductsEvents {
  int categoryId;

  GetProductsByCategoryEvent(this.categoryId);
}

class GetCategoriesEvent extends ProductsEvents {}

class GetCategoryByIdEvent extends ProductsEvents {
  int index;

  GetCategoryByIdEvent(this.index);
}
class UpdateAddressEvent extends ProductsEvents {
  Address address= Address();
UpdateAddressEvent(this.address);
}
class UpdateQtyEvent extends ProductsEvents {
  int newQty;
  Product product;

  UpdateQtyEvent(this.product, this.newQty);
}

class RemoveProductEvent extends ProductsEvents {
  int index;

  RemoveProductEvent(this.index);
}

class GenerateTotalEvent extends ProductsEvents {}

class GetCartItemCount extends ProductsEvents {
  int cartItemCount=0;
  GetCartItemCount(this.cartItemCount);
}

class UpdatePaymentMethodEvent extends ProductsEvents {
  int newId;

  UpdatePaymentMethodEvent(this.newId);
}

class GetCategoryNameEvent extends ProductsEvents {
  int categoryId;

  GetCategoryNameEvent(this.categoryId);
}

class AddToCartEvent extends ProductsEvents {
  Product product;

  AddToCartEvent(this.product);
}
