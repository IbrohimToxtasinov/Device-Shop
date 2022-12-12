import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/screens/admin/products/add_product_screen.dart';
import 'package:device_shop/screens/admin/products/update_product_screen.dart';
import 'package:device_shop/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Admin"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProductScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<ProductViewModel>(
        builder: ((context, productViewModel, child) {
          return ListView(
            children: List.generate(productViewModel.products.length, (index) {
              ProductModel products = productViewModel.products[index];
              return ListTile(
                title: Text(products.productName),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateProductScreen(
                                  productModel: products,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                        onPressed: () {
                          Provider.of<ProductViewModel>(context, listen: false)
                              .deleteProduct(products.productId);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
