import 'package:e_comm_project/controller/product_provider.dart';
import 'package:e_comm_project/controller/remote_config_provider.dart';
import 'package:e_comm_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = context.read<ProductProvider>();

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: context
              .read<RemoteConfigProvider>()
              .fetchAndActivateConfig(productProvider),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
        
            return Consumer<ProductProvider>(
              builder: (context, provider, _) {
                return ListView.builder(
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    final price = provider.getPrice(product);
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: gray),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: black),
                                    borderRadius: BorderRadius.circular(10)
                                    ),
                                  child: Image.network(
                                    product.images![0],
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text.rich(TextSpan(children: [
                                          const TextSpan(text: 'Price:-  '),
                                          TextSpan(
                                              text: '\$${price!.toStringAsFixed(2)}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600))
                                        ])),
                                         Text.rich(TextSpan(children: [
                                          const TextSpan(text: 'Weight:-  '),
                                          TextSpan(
                                              text: product.weight.toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600))
                                        ])),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                         Text(product.description.toString())
                          ],
                        ));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
