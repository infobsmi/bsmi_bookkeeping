import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseUtils {

  static final _databaseName = "bookkeeping.db";
  static final _databaseVersion = 1;

  //私有实例，不允许重复创建实例
  DatabaseUtils._privateConstructor();
  static final DatabaseUtils instance = DatabaseUtils._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreateDatabase);

  }
  Future _onCreateDatabase(Database db, int version) async {

    await db.execute('''
    CREATE TABLE booking ( 
        id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY AUTOINCREMENT,
        name varchar
        , ctime INTEGER DEFAULT 0 NOT NULL, utime INTEGER DEFAULT 0 NOT NULL, "desc" text);
        ''');
    await db.execute('''
    -- transactions definition

CREATE TABLE transactions (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	amount REAL NOT NULL,
	debit_account_id varchar(255),
	credit_account_id varchar(255),
	ctime INTEGER DEFAULT 0 NOT NULL,
	"desc" text
, book_id INTEGER, transaction_id varchar(255));
    ''');
    await db.execute('''
    -- accounts definition

CREATE TABLE accounts (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"type" INTEGER,
	book_id INTEGER,
	amount REAL,
	ctime INTEGER,
	utime INTEGER
);
    ''');

  }

  Future<String?> sqliteVersion() async {
   var db = await instance.database;

   Future<List<Map<String, Object?>>>? qw =  db?.rawQuery('''
   select sqlite_version() as vv;
   ''');
   List<Map<String, Object?>>? fw = await qw;
    Map<String, Object?>? ff = fw?.first;
    if (ff == null) {
      return "none";
    }
    return ff['vv'] as String;

  }
}
