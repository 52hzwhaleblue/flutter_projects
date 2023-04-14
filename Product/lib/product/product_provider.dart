import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_model.dart';

final ProductProvider =
    StateNotifierProvider<ProductController, List<Product>>((ref) {
  return ProductController();
});

class ProductController extends StateNotifier<List<Product>> {
  ProductController() : super([]) {
    fetchProduct();
  }
  Future<List<Product>> fetchProduct() async {
    final dio = Dio();
    Completer<List<Product>> completer = Completer();
    Response<dynamic> response =
        await dio.get('https://fakestoreapi.com/products');
    List<Product> product =
        (response.data as List).map((e) => Product.fromJson(e)).toList();
    completer.complete(product);
    state = product;
    return completer.future;
  }

  void toggleFavourite(int id, bool isFavourite) {
    state = [
      for (final product in state)
        if (product.id == id)
          product.copyWith(isFavourite: isFavourite)
        else
          product,
    ];
  }
}
