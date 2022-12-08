import 'package:device_shop/data/model/category_model.dart';
import 'package:device_shop/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController categoryName = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController imageUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Category"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: categoryName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: description,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'description',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: imageUrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'imageUrl',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                CategoryModel categoryModel = CategoryModel(
                  categoryId: "",
                  categoryName: categoryName.text,
                  description: description.text,
                  imageUrl: imageUrl.text,
                  createdAt: DateTime.now().toString(),
                );
        
                Provider.of<CategoriesViewModel>(context, listen: false)
                    .addCategory(categoryModel);
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}