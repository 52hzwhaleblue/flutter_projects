import 'package:go_router/go_router.dart';

import '../model/Category.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Category> categories = Category.categories;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Category Screen',
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: ((context, index) {
          Category category = categories[index];
          return ListTile(
            title: Text(category.name),
            onTap: () {
              return context.go(
                context.namedLocation(
                  'product_list',
                  params: <String, String>{
                    'category': category.name,
                  },
                  queryParams: <String, String>{
                    'sort': 'desc',
                    'filter': '0',
                  },
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
