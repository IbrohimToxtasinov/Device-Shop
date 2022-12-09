import 'package:device_shop/data/model/category_model.dart';
import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Category"),
      ),
    );
  }
}
