
import 'dart:core';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE users (
      id $idType,
      userCode $textType,
      username $textType,
      tcNo $textType,
      phoneNumber $textType,
      address $textType,
      password $textType,
      editPermission BIT NOT NULL,
      cancelPermission BIT NOT NULL,
      dailyTransaction BIT NOT NULL,
      loginPermission BIT NOT NULL
    )
    ''');
  }

  Future<int> insertUser(Map<String, Kullanici> user) async {
    final db = await instance.database;
    return await db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await instance.database;
    return await db.query('users');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

class Kullanici{
  late int  id ;
   late String  userCode;
    late String username ;
    late String tcNo ;
    late String phoneNumber ;
    late String address ;
    late String password ;
    late bool editPermission ;
    late bool cancelPermission ;
    late bool dailyTransaction ;
    late bool loginPermission;
}

class Test{ 
  void T(){
  int t = k.id;
  }
  Kullanici k = Kullanici();
  
}
