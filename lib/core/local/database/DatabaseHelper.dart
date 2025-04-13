import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  final String _databaseName = 'my_db.db';
  final int _version = 1;

  final String tableNotes = 'notes';

  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnDescription = 'description';
  final String columnCreatedAt = 'created_at';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(
      path,
      version: _version,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableNotes (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT NOT NULL,
        $columnDescription TEXT,
        $columnCreatedAt TEXT NOT NULL
      )
    ''');
  }


  Future<int> insertNote(Map<String, dynamic> note) async {
    final db = await database;
    note[columnCreatedAt] = DateTime.now().toIso8601String();
    return await db.insert(tableNotes, note);
  }


  Future<Map<String, dynamic>?> getNote(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      tableNotes,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? result.first : null;
  }


  Future<List<Map<String, dynamic>>> getAllNotes() async {
    final db = await database;
    return await db.query(tableNotes, orderBy: columnCreatedAt);
  }


  Future<int> updateNote(Map<String, dynamic> note) async {
    final db = await database;
    return await db.update(
      tableNotes,
      note,
      where: '$columnId = ?',
      whereArgs: [note[columnId]],
    );
  }


  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      tableNotes,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }


  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}