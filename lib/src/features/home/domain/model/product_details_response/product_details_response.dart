import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final Data? data;

  const ProductDetailsResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductDetailsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDetailsResponseToJson(this);

  ProductDetailsResponse copyWith({
    bool? success,
    int? statusCode,
    String? message,
    Data? data,
  }) {
    return ProductDetailsResponse(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [success, statusCode, message, data];
}
