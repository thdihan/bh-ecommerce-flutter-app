import 'package:batter_high/src/features/home/domain/model/product_details_response/product_details_response.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/model/product_list_response/product_list_response.dart';

enum ProductDetailsStatus {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllProducts
}

class ProductDetailsState extends Equatable {
  final ProductDetailsResponse productResp;
  final int total;
  final int page;
  final bool hasData;
  final ProductDetailsStatus status;
  final String message;
  final bool isLoading;
  const ProductDetailsState({
    this.productResp = const ProductDetailsResponse(),
    this.isLoading = false,
    this.hasData = false,
    this.status = ProductDetailsStatus.initial,
    this.message = '',
    this.page = 0,
    this.total = 0,
  });

  const ProductDetailsState.initial({
    this.productResp = const ProductDetailsResponse(),
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.status = ProductDetailsStatus.initial,
    this.message = '',
  });

  ProductDetailsState copyWith({
    ProductDetailsResponse? productResp,
    int? total,
    int? page,
    bool? hasData,
    ProductDetailsStatus? status,
    String? message,
    bool? isLoading,
  }) {
    return ProductDetailsState(
      isLoading: isLoading ?? this.isLoading,
      productResp: productResp ?? this.productResp,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'DashboardState(isLoading:$isLoading,total:$total page: $page, hasData: $hasData, state: $status, message: $message)';
  }

  @override
  List<Object?> get props => [productResp, page, hasData, status, message];
}
