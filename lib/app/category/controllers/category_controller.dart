import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/domain/entities/category.dart';
import 'package:pcnc_todo_task/domain/interactors_impl/category_interactor_impl.dart';

class CategoryController {
  final CategoryInteractorImpl categoryInteractorImpl;
  final RxList<Category> categories = <Category>[].obs;

  CategoryController() : categoryInteractorImpl = CategoryInteractorImpl();

  Future<void> fetchCategories() async {
    List<Category> categoryList = await categoryInteractorImpl.getCategories();
    categories.assignAll(categoryList);
  }

  Future<int> addCategory(Category category) async {
    int categoryId = await categoryInteractorImpl.insertCategory(category);
    if (categoryId > 0) {
      category.id = categoryId;
      categories.add(category);
    }
    return categoryId;
  }

  Future<void> deleteCategory(int categoryId) async {
    await categoryInteractorImpl.deleteCategory(categoryId);
    categories.removeWhere((c) => c.id == categoryId);
  }
}
