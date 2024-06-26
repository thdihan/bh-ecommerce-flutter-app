import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'product_list_response.g.dart';

@JsonSerializable()
class ProductListResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final Data? data;

  const ProductListResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);

  ProductListResponse copyWith({
    bool? success,
    int? statusCode,
    String? message,
    Data? data,
  }) {
    return ProductListResponse(
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
