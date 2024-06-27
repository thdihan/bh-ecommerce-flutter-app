import 'package:batter_high/src/core/shared/domain/models/category_response.dart';
import 'package:batter_high/src/features/home/data/remote/home_data_source_remote.dart';
import 'package:batter_high/src/features/home/domain/repositories/category_repository.dart';

import '../../../../core/shared/domain/models/either.dart';
import '../../../../core/shared/exceptions/app_exceptions.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryDataSource categoryDataSource;
  CategoryRepositoryImpl(this.categoryDataSource);

  @override
  Future<Either<AppException, CategoryResponse>> fetchCategory(
      {String local = "en", required String category}) {
    return categoryDataSource.fetchProducts(local: local, category: category);
  }
}
