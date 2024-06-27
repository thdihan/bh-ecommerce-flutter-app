import 'dart:convert';

import 'package:batter_high/src/core/shared/domain/models/category_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/shared/domain/models/either.dart';
import '../../../../../../core/shared/exceptions/app_exceptions.dart';
import '../../../../domain/model/category_list_response/category_list_response.dart';
import '../../../../domain/repositories/category_repository.dart';
import 'category_state.dart';

class CategoryNotifier extends StateNotifier<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryNotifier(
    this.categoryRepository,
  ) : super(const CategoryState.initial());

  bool get isFetching =>
      state.status != CategoryStatus.loading &&
      state.status != CategoryStatus.fetchingMore;

  Future<void> fetchCategory({required String category}) async {
    state = state.copyWith(
      status: CategoryStatus.loading,
      isLoading: true,
    );

    final response = await categoryRepository.fetchCategory(category: category);

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
      Either<AppException, CategoryResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        status: CategoryStatus.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      print(data.data);
      final categoryResp =
          CategoryListResponse.fromJson(jsonDecode(jsonEncode(data.data)));

      // final totalColumnNews = [...state.posts, ...postList];
      print(categoryResp);

      state = state.copyWith(
        categoryResp: categoryResp,
        status: CategoryStatus.loaded,
        hasData: true,
        // message: totalColumnNews.isEmpty ? 'No products found' : '',
        page: state.page,
        // total: totalColumnNews.length,
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const CategoryState.initial();
  }
}
