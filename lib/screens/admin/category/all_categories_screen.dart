import 'package:device_shop/data/model/category_model.dart';
import 'package:device_shop/screens/admin/category/add_category_screen.dart';
import 'package:device_shop/screens/admin/category/update_category_screen.dart';
import 'package:device_shop/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories Admin"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddCategoryScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<CategoriesViewModel>(
        builder: ((context, categoryViewModel, child) {
          return ListView(
            children: List.generate(categoryViewModel.categories.length, (index) {
              CategoryModel category = categoryViewModel.categories[index];
              return ListTile(
                title: Text(category.categoryName),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateCategoryScreen(
                                  categoryModel: category,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            Provider.of<CategoriesViewModel>(context,
                                    listen: false)
                                .deleteCategory(category.categoryId);

                            print("DELETING ID:${category.categoryId}");
                          },
                          icon: const Icon(Icons.delete)),
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
