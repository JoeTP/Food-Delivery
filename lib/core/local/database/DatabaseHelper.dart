import 'dart:async';
import 'package:daythree/data/model/CartItemModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../../features/auth/data/models/User.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper._();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._();

  static Database? _database;

  final String _databaseName = 'my_db.db';
  final int _version = 1;

  //?Cart
  final String tableCart = 'cart';
  final String mealIdColumn = 'id';
  final String mealNameColumn = 'name';
  final String mealImageColumn = 'image';
  final String mealCountColumn = "count";

  //?Users
  final String tableUsers = 'users';
  final String nameColumn = 'name';
  final String emailColumn = 'email';
  final String passwordColumn = 'password';

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
      CREATE TABLE $tableUsers (
        $emailColumn TEXT PRIMARY KEY NOT NULL,
        $nameColumn TEXT NOT NULL,
        $passwordColumn TEXT NOT NULL
        )
    ''');

    await db.execute('''
      CREATE TABLE $tableCart (
        $mealIdColumn TEXT PRIMARY KEY NOT NULL,
        $mealNameColumn TEXT NOT NULL,
        $mealCountColumn INTEGER NOT NULL,
        $mealImageColumn TEXT NOT NULL
        )
    ''');
  }

  Future<int> insertItemToCart(CartItemModel item) async{
    final db = await database;
    return await db.insert(tableCart, item.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }


  Future<List<CartItemModel>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(tableCart);
    return result.map((e) => CartItemModel.fromJson(e)).toList();
  }

  Future<int> deleteItemFromCart(String id) async{
    final db = await database;
    return await db.delete(tableCart, where: '$mealIdColumn = ?', whereArgs: [id]);
  }


  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert(tableUsers, user.toJson());
  }


  Future<User?> getUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      tableUsers,
      where: '$emailColumn = ? AND $passwordColumn = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty ? User.fromJson(result.first) : null;
  }


  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}