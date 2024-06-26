import '../../../../core/shared/domain/models/either.dart';
import '../../../../core/shared/exceptions/app_exceptions.dart';
import '../../domain/model/product_list_response/product_list_response.dart';
import '../../domain/repository/product_repository.dart';
import '../remote/home_data_source_remote.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource productRemoteDataSource;

  ProductRepositoryImpl(this.productRemoteDataSource);

  @override
  Future<Either<AppException, ProductListResponse>> fetchProducts(
      {String local = "en", required String category}) async {
    return productRemoteDataSource.fetchProducts(
        local: local, category: category);
  }
}
