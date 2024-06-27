import 'package:batter_high/src/core/shared/domain/models/category_response.dart';
import 'package:batter_high/src/core/shared/domain/models/product_response.dart';

import '../../../../core/shared/domain/models/either.dart';
import '../../../../core/shared/exceptions/app_exceptions.dart';

abstract class CategoryRepository {
  Future<Either<AppException, CategoryResponse>> fetchCategory(
      {String local = "en", required String category});
}
