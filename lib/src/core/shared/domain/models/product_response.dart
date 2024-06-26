class ProductResponse<T> {
  final T data;

  ProductResponse({required this.data});

  factory ProductResponse.fromJson(dynamic json, T data,
          {Function(dynamic json)? fixture}) =>
      ProductResponse(
        data: data,
      );
  @override
  String toString() {
    return 'CategoryWiseNewsResponseForHome( data:${data.toString()})';
  }
}
