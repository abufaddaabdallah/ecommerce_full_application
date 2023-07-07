class Inventory{
   late int id;
  late String name;
  Inventory(this.id,this.name);

   Inventory.fromJson(Map<String,dynamic> json ){
    id = int.parse(json["id"].toString());
    name = json["id"];
  }
}