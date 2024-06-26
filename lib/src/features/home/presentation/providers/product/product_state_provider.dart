import 'package:batter_high/src/features/home/presentation/providers/product/product_providers.dart';
import 'package:batter_high/src/features/home/presentation/providers/product/state/product_notifier.dart';
import 'package:batter_high/src/features/home/presentation/providers/product/state/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductNotifier(repository);
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
