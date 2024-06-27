import 'package:batter_high/src/features/home/data/remote/home_data_source_remote.dart';
import '../../../../../core/shared/data/remote/network_service.dart';
import '../../../../../core/shared/providers/dio_network_service_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/category_repository_impl.dart';
import '../../../domain/repositories/category_repository.dart';

final categoryDataSourceProvider =
    Provider.family<CategoryDataSource, NetworkService>(
  (_, networkService) => CategoryRemoteDataSource(networkService),
);

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final dataSource = ref.watch(categoryDataSourceProvider(networkService));
  final repository = CategoryRepositoryImpl(dataSource);

  return repository;
});
