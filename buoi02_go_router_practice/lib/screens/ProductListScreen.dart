import 'package:go_router/go_router.dart';

import '../model/Product.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({
    super.key,
    required this.category,
    required this.asc,
    required this.quantity,
  });
  final String category;
  final bool asc;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.products
        .where(((product) => product.category == category))
        .where(((product) => product.quantity > quantity))
        .toList();

    // product_items.sort((a, b) => a.name.compareTo(b.name));
    return Scaffold(
        appBar: AppBar(
          title: Text(
            category,
          ),
          actions: [
            IconButton(
              onPressed: () {
                String sort = asc ? 'desc' : 'asc';
                return context.goNamed(
                  'product_list',
                  params: <String, String>{'category': category},
                  queryParams: <String, String>{
                    'sort': sort,
                  },
                );
              },
              icon: Icon(
                Icons.sort,
              ),
            ),
            IconButton(
              onPressed: () {
                String sort = asc ? 'desc' : 'asc';
                return context.goNamed('product_list',
                    params: <String, String>{'category': category},
                    queryParams: <String, String>{'filter': '10'});
              },
              icon: Icon(
                Icons.filter_alt,
              ),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            for (final Product product in asc ? products : products.reversed)
              ListTile(
                title: Text(product.name),
              )
          ],
        )

        // ListView.builder(
        //   itemCount: product_items.length,
        //   itemBuilder: ((context, index) {
        //     Product products = product_items[index];
        //     return ListTile(
        //       title: Text(products.name),
        //       onTap: () {
        //         return context.goNamed('home');
        //       },
        //     );
        //   }),
        // ),
        );
  }
}
