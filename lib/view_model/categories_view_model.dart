import 'dart:async';

import 'package:device_shop/data/model/category_model.dart';
import 'package:device_shop/data/repositories/categories_repository.dart';
import 'package:flutter/cupertino.dart';

class CategoriesViewModel extends ChangeNotifier {
  final CategoryRepository categoryRepository;

  CategoriesViewModel({required this.categoryRepository}) {
    listenCategories();
  }

  late StreamSubscription subscription;

  List<CategoryModel> categories = [];

  listenCategories() async {
    subscription = categoryRepository.getCategories().listen((allCategories) {
      categories = allCategories;
      notifyListeners();
    })
      ..onError((er) {});
  }

  addCategory(CategoryModel categoryModel) =>
      categoryRepository.addCategory(categoryModel: categoryModel);
  updateCategory(CategoryModel categoryModel) =>
      categoryRepository.updateCategory(categoryModel: categoryModel);
  deleteCategory(String docId) =>
      categoryRepository.deleteCategory(doId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
