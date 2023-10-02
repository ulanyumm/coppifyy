import 'package:flutter/material.dart';
import 'package:hypotenuse/purchase/purchases_provider.dart';
import 'package:provider/provider.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final purchaseProvider = Provider.of<PurchaseProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('In App Purchase Demo')),
      body: purchaseProvider.available
          ? ListView.builder(
              itemCount: purchaseProvider.products.length,
              itemBuilder: (context, index) {
                final product = purchaseProvider.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: ElevatedButton(
                    onPressed: () {
                      purchaseProvider.buyProduct(product);
                    },
                    child: const Text('Buy'),
                  ),
                );
              },
            )
          : const Center(
              child: Text('In-app purchase not available.'),
            ),
    );
  }
}
