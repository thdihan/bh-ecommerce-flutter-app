import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? productCode;
  final String? name;
  final double? price;
  final int? stock;
  final String? description;
  final String? image;
  final List<String>? categories;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  const Datum({
    this.id,
    this.productCode,
    this.name,
    this.price,
    this.stock,
    this.description,
    this.image,
    this.categories,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    String? id,
    String? productCode,
    String? name,
    double? price,
    int? stock,
    String? description,
    String? image,
    List<String>? categories,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return Datum(
      id: id ?? this.id,
      productCode: productCode ?? this.productCode,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      description: description ?? this.description,
      image: image ?? this.image,
      categories: categories ?? this.categories,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
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
      createdAt,
      updatedAt,
      v,
    ];
  }
}
