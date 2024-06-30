
import 'dart:convert';

import 'package:batter_high/src/core/shared/domain/models/product_response.dart';
import 'package:batter_high/src/features/home/domain/model/product_details_response/product_details_response.dart';
import 'package:batter_high/src/features/home/domain/repositories/product_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/shared/domain/models/either.dart';
import '../../../../../../core/shared/exceptions/app_exceptions.dart';

import 'product_details_state.dart';


class ProductDetailsNotifier extends StateNotifier<ProductDetailsState> {
  final ProductRepository productRepository;

  ProductDetailsNotifier(
    this.productRepository,
  ) : super(const ProductDetailsState.initial());

  bool get isFetching =>
      state.status != ProductDetailsStatus.loading &&
      state.status != ProductDetailsStatus.fetchingMore;

  Future<void> fetchProductById({required String id}) async {
    state = state.copyWith(
      status: ProductDetailsStatus.loading,
      isLoading: true,
    );

    final response = await productRepository.fetchProductById(id: id);

    updateStateFromResponse(response);
  }

  // Future<void> searchProducts(String query) async {
  //   if (isFetching &&
  //       state.status != SliderConcreteState.fetchedAllProducts) {
  //     state = state.copyWith(
  //       status: state.page > 0
  //           ? SliderConcreteState.fetchingMore
  //           : SliderConcreteState.loading,
  //       isLoading: true,
  //     );

  //     final response = await SliderRepository.searchProducts(
  //       skip: state.page * PRODUCTS_PER_PAGE,
  //       query: query,
  //     );

  //     updateStateFromResponse(response);
  //   } else {
  //     state = state.copyWith(
  //       status: SliderConcreteState.fetchedAllProducts,
  //       message: 'No more products available',
  //       isLoading: false,
  //     );
  //   }
  // }

  void updateStateFromResponse(
      Either<AppException, ProductResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        status: ProductDetailsStatus.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      print(data.data);
      final productResp =
          ProductDetailsResponse.fromJson(jsonDecode(jsonEncode(data.data)));

      // final totalColumnNews = [...state.posts, ...postList];
      print(productResp);

      state = state.copyWith(
        productResp: productResp,
        status: ProductDetailsStatus.loaded,
        hasData: true,
        // message: totalColumnNews.isEmpty ? 'No products found' : '',
       
        // total: totalColumnNews.length,
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const ProductDetailsState.initial();
  }
}
