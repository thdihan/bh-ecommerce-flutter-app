import 'package:batter_high/src/core/shared/domain/models/product_response.dart';

import '../../../../core/shared/domain/models/either.dart';
import '../../../../core/shared/exceptions/app_exceptions.dart';

abstract class ProductRepository {
  Future<Either<AppException, ProductResponse>> fetchProducts(
      {String local = "en", required String category});
  Future<Either<AppException, ProductResponse>> fetchProductById(
      {String local = "en", required int id});
}
