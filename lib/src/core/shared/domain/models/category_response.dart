class CategoryResponse<T> {
  final T data;

  CategoryResponse({required this.data});

  factory CategoryResponse.fromJson(dynamic json, T data,
          {Function(dynamic json)? fixture}) =>
      CategoryResponse(
        data: data,
      );
  @override
  String toString() {
    return 'CategoryWiseNewsResponseForHome( data:${data.toString()})';
  }
}
