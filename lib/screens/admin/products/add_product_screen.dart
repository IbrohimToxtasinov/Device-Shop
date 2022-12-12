import 'package:device_shop/data/model/category_model.dart';
import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/view_model/categories_view_model.dart';
import 'package:device_shop/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  final TextEditingController countController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> productImages = [
    "https://www.pngitem.com/pimgs/m/183-1831803_laptop-collection-png-transparent-png.png",
    "https://www.pngitem.com/pimgs/m/183-1831803_laptop-collection-png-transparent-png.png",
  ];
  String categoryId = "";
  CategoryModel? categoryModel;
  String createdAt = DateTime.now().toString();
  List<String> currencies = ["USD", "SO'M", "RUBL", "TENGE"];
  String selectedCurrency = "USD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Product Name',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'price',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: countController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Count',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: descriptionController,
                maxLines: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                ),
              ),
              const SizedBox(height: 20),
              ExpansionTile(
                title: Text(selectedCurrency.isEmpty
                    ? "Select  Currncy"
                    : selectedCurrency),
                children: [
                  ...List.generate(
                      currencies.length,
                      (index) => ListTile(
                            title: Text(currencies[index]),
                            onTap: () {
                              setState(() {
                                selectedCurrency = currencies[index];
                              });
                            },
                          ))
                ],
              ),
              TextButton(
                onPressed: () {
                  selectCategory((selectedCategory) {
                    categoryModel = selectedCategory;
                    categoryId = categoryModel!.categoryId;
                    setState(() {});
                  });
                },
                child: Text(
                  categoryModel == null
                      ? "Select Category"
                      : categoryModel!.categoryName,
                ),
              ),
              TextButton(
                onPressed: () {
                  ProductModel productModel = ProductModel(
                    count: int.parse(countController.text),
                    price: int.parse(priceController.text),
                    productImages: productImages,
                    categoryId: categoryId,
                    productId: "",
                    productName: nameController.text,
                    description: descriptionController.text,
                    createdAt: createdAt,
                    currency: selectedCurrency,
                  );

                  Provider.of<ProductViewModel>(context, listen: false)
                      .addProduct(productModel);
                },
                child: const Text("Add Product to Fire Store"),
              )
            ],
          ),
        ),
      ),
    );
  }

  selectCategory(ValueChanged<CategoryModel> onCategorySelect) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: Consumer<CategoriesViewModel>(
              builder: ((context, categoryViewModel, child) {
                List<CategoryModel> categories = categoryViewModel.categories;
                return ListView(
                  children: List.generate(
                    categories.length,
                    (index) => ListTile(
                      title: Text(categories[index].categoryName),
                      onTap: () {
                        onCategorySelect.call(categories[index]);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
