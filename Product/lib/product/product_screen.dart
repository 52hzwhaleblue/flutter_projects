import 'product_model.dart';
import 'product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(ProductProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: (list.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 310),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final Product product = list[index];
                  return ShowProduct(product);
                },
              ),
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }
}

class ShowProduct extends ConsumerWidget {
  const ShowProduct(
    this.product, {
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (!product.isFavourite)
                  ? InkWell(
                      onTap: () {
                        ref
                            .read(ProductProvider.notifier)
                            .toggleFavourite(product.id!.toInt(), true);
                      },
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        ref
                            .read(ProductProvider.notifier)
                            .toggleFavourite(product.id!.toInt(), false);
                      },
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Image.network(product.image.toString(),
                  width: 120, height: 120, frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                return child;
              }, loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }
              }),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              product.title.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(
                  color: const Color(0xFF4C53A5),
                  fontWeight: FontWeight.w600,
                  height: 1.2),
            ),
          ),
          Text(
            product.description.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(fontSize: 12, height: 1.3),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price.toString()}",
                  style: GoogleFonts.lato(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w900),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                        Text(
                          product.rating!.rate.toString(),
                          style: GoogleFonts.lato(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
