import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const int _databaseVersion = 1;

class DatabaseProvider {
  static const _databaseName = 'to_do.db';
  late Database db;

  DatabaseProvider._privateConstructor();

  static final DatabaseProvider instance =
      DatabaseProvider._privateConstructor();

  static Database? _database;

  Future<void> init() async {
    db = await open;
  }

  Future<Database> get open async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name TEXT NOT NULL,
      color INTEGER NOT NULL,
      icon INTEGER NOT NULL
    )
  ''');

    await db.execute('''
    CREATE TABLE tasks (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      title TEXT NOT NULL,
      description TEXT,
      creationDate TEXT,
      dueDate TEXT,
      isCompleted INTEGER NOT NULL DEFAULT 0,
      isPrivate INTEGER NOT NULL DEFAULT 0,
      categoryId INTEGER NOT NULL,
      FOREIGN KEY (categoryId) REFERENCES categories(id)
    )
  ''');
  }
}
