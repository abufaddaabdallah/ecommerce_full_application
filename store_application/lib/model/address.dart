class Address {
  // int? id;
  double latitude = 0;
  double longitude = 0;
  String country = "";
  String city = "";
  String area = "";
  String street = "";

  // String? buildingNo = "1";
  //
  // Address({
  //   // this.id,
  //    this.area,
  //   // this.buildingNo,
  //    this.city,
  //    this.country,
  //    this.latitude,
  //    this.longitude,
  //    this.street,
  // });
  //
  // factory Address.fromJson(Map<String, dynamic> json) {
  //   return Address(
  //     // id: json["id"] ?? 1,
  //     latitude: json["latitude"] ?? 33.222,
  //     longitude: json["longitude"] ?? 34.223,
  //     country: json["country"] ?? "",
  //     city: json["city"] ?? "",
  //     area: json["area"] ?? "",
  //     street: json["street"] ?? "",
  //     // buildingNo: json["buildingNo"] ?? "",
  //   );
  // }

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "country": country,
        "city": city,
        "area": area,
        "street": street,
        // "building_no": buildingNo,
      };
}
