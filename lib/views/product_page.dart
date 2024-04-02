import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zinc_product_demo/models/product.dart';
import 'package:zinc_product_demo/widgets/rating_widget.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Theme.of(context).canvasColor,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productImageWithInfo(context),
            _productDescription(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 16.0, top: 8),
            padding: const EdgeInsets.all(6.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget _productImageWithInfo(BuildContext context) {
    return Stack(
      children: [
        _productImage(context),
        _productInfo(context),
      ],
    );
  }

  Container _productImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
          bottom: Radius.zero,
        ),
      ),
      child: Hero(
        tag: product.id.toString(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: product.image!,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.black26,
              highlightColor: Colors.black12,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54,
                ),
                width: double.infinity,
                height: 400,
              ),
            ),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Positioned _productInfo(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: GlassContainer(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        blur: 10,
        opacity: 0.15,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 110,
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.title ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RatingWidget(
                      stars: product.rating!.rate!.toInt(),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '\$ ${product.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productDescription() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
      child: Text(
        product.description ?? '',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
    );
  }
}
