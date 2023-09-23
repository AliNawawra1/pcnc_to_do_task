import 'package:pcnc_todo_task/data/data_sources/category_data_source.dart';
import 'package:pcnc_todo_task/domain/entities/category.dart';
import '../interactors/category_interactor.dart';

class CategoryInteractorImpl implements CategoryInteractor {
  final CategoryDataSource categoryDataSource;

  CategoryInteractorImpl() : categoryDataSource = CategoryDataSource();

  @override
  Future<List<Category>> getCategories() async {
    return await categoryDataSource.getCategories();
  }

  @override
  Future<int> insertCategory(Category category) async {
    return await categoryDataSource.insertCategory(category);
  }

  @override
  Future<void> updateCategory(Category category) async {
    await categoryDataSource.updateCategory(category);
  }

  @override
  Future<void> deleteCategory(int categoryId) async {
    await categoryDataSource.deleteCategory(categoryId);
  }

  @override
  Future<Category> getCategoryById(int categoryId) async {
    return await categoryDataSource.getCategoryById(categoryId);
  }
}
