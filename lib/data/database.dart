import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'adocao8.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
    '''
    CREATE TABLE pessoa(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      cpf TEXT,
      telefone TEXT,
      endereco TEXT,
      email TEXT
    )
    '''
  );
   await db.execute('''
      CREATE TABLE animal(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cpf TEXT,
        nome TEXT,
        idade TEXT,
        raca TEXT,
        descricao TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE tipo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cpf TEXT,
        idCachorro TEXT,
        tipo TEXT,
        descricao TEXT
      )
    ''');
    print('Tabela "items" criada com sucesso!');
  }
}