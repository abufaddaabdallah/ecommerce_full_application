class Category{
  late int id;
  late String name;
  late String icon;
  Category(this.id,this.name,this.icon);

   factory Category.fromJson(Map<String,dynamic> json ){
    return Category( int.parse(json["id"].toString()), json["name"],json["icon"]);
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "icon": icon
      };
}