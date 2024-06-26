import 'package:equatable/equatable.dart';
import '../../../../domain/model/product_list_response/product_list_response.dart';

enum ProductStatus {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllProducts
}

class ProductState extends Equatable {
  final ProductListResponse productResp;
  final int total;
  final int page;
  final bool hasData;
  final ProductStatus status;
  final String message;
  final bool isLoading;
  const ProductState({
    this.productResp = const ProductListResponse(),
    this.isLoading = false,
    this.hasData = false,
    this.status = ProductStatus.initial,
    this.message = '',
    this.page = 0,
    this.total = 0,
  });

  const ProductState.initial({
    this.productResp = const ProductListResponse(),
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.status = ProductStatus.initial,
    this.message = '',
  });

  ProductState copyWith({
    ProductListResponse? productResp,
    int? total,
    int? page,
    bool? hasData,
    ProductStatus? status,
    String? message,
    bool? isLoading,
  }) {
    return ProductState(
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
