import 'category.dart';

class Product {
  late int id;
  late int categoryId;
  late String image;
  late String name;
  late String color;
  late String size;
  late double price;
  late double tax = 16;
  // late int currentQty;
  late String description;
  late Category? category;
  int selectedQty = 1;

  Product({
    required this.id,
    required this.categoryId,
    required this.image,
    required this.price,
    required this.name,
    required this.color,
    required this.size,
    required this.description,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "product_id": id,
        "image": image,
        "color": color,
        "size": size,
        "total": total,
        "price": price,
        "name": name,
        "qty": selectedQty,
        "description": description,
        'Category': category!.toJson(),

        // "Category": categories.map((e) => e.toJson()).toList(),
      };

  factory Product.fromJson(Map<String, dynamic> json) {
    double parsedPrice;
    try {
      parsedPrice = double.parse(json['price'].toString());
    } catch (e) {
      parsedPrice = 0.0;
    }
    return Product(
      id: json["id"] ?? 1,
      categoryId: json["category_id"] ?? 1,
      image: json["image"] ?? "",
      color: json["color"] ?? "",
      size: json["size"] ?? "",
      price: parsedPrice,
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      category: json['Category'] != null
          ? Category.fromJson(json['Category'] as Map<String, dynamic>)
          : null,
    );
  }

  // Product.fromJson(Map<String, dynamic> json) {
  //   id = int.parse(json["id"].toString());
  //   color = json["color"];
  //   size = json["size"];
  //   name = json["name"];
  //   categoryId = int.parse(json["category_id"].toString());
  //   image = json["image"];
  //   price = double.parse(json["price"].toString());
  //   currentQty = int.parse(json["current_qty"].toString());
  //   description = json["description"];
  //   categories = Category.fromJson(json["category"]);
  // }

  double get finalPrice {
    return price * (1 + (tax / 100));
  }

  double get subTotal {
    return price * selectedQty;
  }

  double get taxAmount {
    return (price * (tax / 100)) * selectedQty;
  }

  double get total {
    return (price * (1 + (tax / 100))) * selectedQty;
  }

  double get total2 => price * selectedQty;
// Future<List<String>> getImageLinks() async {
//   final db = await database;
//   final res = await db.query('Images');
//   return res.map((row) => row['link'] as String).toList();
// }

// Product.fromJson(Map<String, dynamic> json) {
//   id = int.parse(json["id"].toString());
//   currentQty = int.parse(json["current_qty"].toString());
//   price = double.parse(json["price"].toString());
//   description = json["description"];
//   categoryId = int.parse(json["category_id"].toString());
//   name = json["name"];
//   image = json["image"];
//   category = Category.fromJson(json["category"]);
// }
}
