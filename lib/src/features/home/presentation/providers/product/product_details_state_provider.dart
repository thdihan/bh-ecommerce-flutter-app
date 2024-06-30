import 'package:batter_high/src/features/home/presentation/providers/product/product_providers.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/product_details_notifier.dart';
import 'state/product_details_state.dart';

final productDetailsNotifierProvider =
    StateNotifierProvider<ProductDetailsNotifier, ProductDetailsState>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  print("step 1");
  return ProductDetailsNotifier(repository);
});
// final categoryEconomyNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryStockNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryTradeNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryNationalNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryBanglaNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categorySportsNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryEducationNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryYouthAndEntrepreneurshipNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryLifeStyleNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryWorldNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryViewsNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryMoreNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryLiveMediaNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
