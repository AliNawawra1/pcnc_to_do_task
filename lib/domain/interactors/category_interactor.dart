import 'package:pcnc_todo_task/domain/entities/category.dart';

abstract class CategoryInteractor {
  Future<List<Category>> getCategories();

  Future<int> insertCategory(Category category);

  Future<void> updateCategory(Category category);

  Future<void> deleteCategory(int categoryId);
}
