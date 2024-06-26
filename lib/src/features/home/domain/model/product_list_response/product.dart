import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? productCode;
  final String? name;
  final double? price;
  final int? stock;
  final String? description;
  final String? image;
  final List<String>? categories;
  @JsonKey(name: '__v')
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Product({
    this.id,
    this.productCode,
    this.name,
    this.price,
    this.stock,
    this.description,
    this.image,
    this.categories,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    String? id,
    String? productCode,
    String? name,
    double? price,
    int? stock,
    String? description,
    String? image,
    List<String>? categories,
    int? v,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      productCode: productCode ?? this.productCode,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      description: description ?? this.description,
      image: image ?? this.image,
      categories: categories ?? this.categories,
      v: v ?? this.v,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      productCode,
      name,
      price,
      stock,
      description,
      image,
      categories,
      v,
      createdAt,
      updatedAt,
    ];
  }
}
