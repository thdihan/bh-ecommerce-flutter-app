import 'package:batter_high/src/features/home/data/remote/home_data_source_remote.dart';
import 'package:batter_high/src/features/home/data/repositories/product_repository_impl.dart';
import 'package:batter_high/src/features/home/domain/repositories/product_repository.dart';

import '../../../../../core/shared/data/remote/network_service.dart';
import '../../../../../core/shared/providers/dio_network_service_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final productDataSourceProvider =
    Provider.family<ProductDataSource, NetworkService>(
  (_, networkService) => ProductRemoteDataSource(networkService),
);

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final dataSource = ref.watch(productDataSourceProvider(networkService));
  final repository = ProductRepositoryImpl(dataSource);

  return repository;
});
