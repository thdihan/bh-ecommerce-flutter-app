import 'package:batter_high/src/features/home/data/remote/home_data_source_remote.dart';

import '../../../../core/shared/domain/models/either.dart';
import '../../../../core/shared/exceptions/app_exceptions.dart';
import '../../domain/model/product_list_response/product_list_response.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource categoryWiseNewsDataSource;
  ProductRepositoryImpl(this.categoryWiseNewsDataSource);

  @override
  Future<Either<AppException, ProductListResponse>> fetchProducts(
      {String local = "en", required String category}) {
    return categoryWiseNewsDataSource.fetchCategoryWiseNews(
        local: local, category: category);
  }
}
