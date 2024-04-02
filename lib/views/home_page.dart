import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zinc_product_demo/viewmodels/product_view_model.dart';
import 'package:zinc_product_demo/widgets/product_item.dart';
import 'product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductViewModel productViewModel;

  @override
  void initState() {
    super.initState();
    productViewModel = ProductViewModel();
    productViewModel.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => productViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
        ),
        body: Consumer<ProductViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.products.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: viewModel.products.length,
              itemBuilder: (context, index) {
                final product = viewModel.products[index];
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(product: product),
                    ),
                  ),
                  child: ProductItem(product: product),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
