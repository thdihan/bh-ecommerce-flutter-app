import 'dart:convert';

import 'package:financialexpress/shared/domain/models/category_wise_news_response.dart';

import '../../../../core/shared/data/remote/remote.dart';
import '../../../../core/shared/domain/models/either.dart';

import '../../../../core/shared/exceptions/app_exceptions.dart';
import '../../domain/model/product_list_response.dart';

abstract class CategoryWiseNewsDataSource {
  Future<Either<AppException, ProductListResponse>> fetchCategoryWiseNews(
      {String local = "en", required String category});
  // Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts(
  //     {required int skip, required String query});
}

class SliderRemoteDataSource extends ProductListResponse {
  final NetworkService networkService;
  SliderRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, ProductListResponse>> fetchCategoryWiseNews(
      {String local = "en", required String category}) async {
    final response = await networkService.get(
      '$local/home/$category',
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchPaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format',
            ),
          );
        }
        final paginatedResponse =
            ProductListResponse.fromJson(jsonDecode(jsonEncode(jsonData)));
        return Right(paginatedResponse);
      },
    );
  }

  // @override
  // Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts(
  //     {required int skip, required String query}) async {
  //   final response = await networkService.get(
  //     '/products/search?q=$query',
  //     queryParameters: {
  //       'skip': skip,
  //       'limit': PRODUCTS_PER_PAGE,
  //     },
  //   );

  //   return response.fold(
  //     (l) => Left(l),
  //     (r) {
  //       final jsonData = r.data;
  //       if (jsonData == null) {
  //         return Left(
  //           AppException(
  //             identifier: 'search PaginatedData',
  //             statusCode: 0,
  //             message: 'The data is not in the valid format.',
  //           ),
  //         );
  //       }
  //       final paginatedResponse =
  //           PaginatedResponse.fromJson(jsonData, jsonData['products'] ?? []);
  //       return Right(paginatedResponse);
  //     },
  //   );
  // }
}