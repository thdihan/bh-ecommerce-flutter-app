import '../../../../core/shared/domain/models/either.dart';
import '../../../../core/shared/exceptions/app_exceptions.dart';
import '../model/product_list_response/product_list_response.dart';

abstract class ProductRepository {
  Future<Either<AppException, ProductListResponse>> fetchProducts(
      {String local = "en", required String category});
}
