import 'package:pcnc_todo_task/data/database/database_provider.dart';
import 'package:pcnc_todo_task/domain/entities/category.dart';
import 'package:pcnc_todo_task/domain/interactors/category_interactor.dart';


class CategoryDataSource implements CategoryInteractor {
  final DatabaseProvider database;

  CategoryDataSource() : database = DatabaseProvider.instance;

  @override
  Future<List<Category>> getCategories() async {
    final List<Map<String, dynamic>> categoryMaps =
        await database.db.query('categories');
    return categoryMaps.map((map) => Category.fromMap(map)).toList();
  }

  @override
  Future<int> insertCategory(Category category) async {
    return await database.db.insert('categories', category.toMap());
  }

  @override
  Future<void> updateCategory(Category category) async {
    await database.db.update(
      'categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  @override
  Future<void> deleteCategory(int categoryId) async {
    await database.db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [categoryId],
    );
  }
}
