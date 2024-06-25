
class ProductListResponse {
  bool? success;
  int? statusCode;
  String? message;
  List<Data>? data;

  ProductListResponse({this.success, this.statusCode, this.message, this.data});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["statusCode"] is int) {
      statusCode = json["statusCode"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["statusCode"] = statusCode;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? productCode;
  String? name;
  double? price;
  int? stock;
  String? description;
  String? image;
  List<String>? categories;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({this.id, this.productCode, this.name, this.price, this.stock, this.description, this.image, this.categories, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["productCode"] is String) {
      productCode = json["productCode"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["price"] is double) {
      price = json["price"];
    }
    if(json["stock"] is int) {
      stock = json["stock"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["categories"] is List) {
      categories = json["categories"] == null ? null : List<String>.from(json["categories"]);
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["productCode"] = productCode;
    _data["name"] = name;
    _data["price"] = price;
    _data["stock"] = stock;
    _data["description"] = description;
    _data["image"] = image;
    if(categories != null) {
      _data["categories"] = categories;
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}