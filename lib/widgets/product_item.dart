import 'package:flutter/material.dart';
import 'package:zinc_product_demo/models/product.dart';
import 'package:zinc_product_demo/widgets/custom_clipper.dart';
import 'package:zinc_product_demo/widgets/product_image.dart';
import 'package:zinc_product_demo/widgets/rating_widget.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 8),
            height: 150,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                color: const Color.fromARGB(255, 225, 222, 222),
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: product.id.toString(),
                  child: ProductImage(image: product.image!),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title!,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Category : ${product.category}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$ ${product.price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.redAccent),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: -20,
            child: Transform.rotate(
              angle: -0.6,
              child: ClipPath(
                clipper: TrapezoidClipper(),
                child: Container(
                  height: 20,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurpleAccent,
                  ),
                  child: Center(
                    child: RatingWidget(
                      stars: product.rating!.rate!.toInt(),
                      starSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
