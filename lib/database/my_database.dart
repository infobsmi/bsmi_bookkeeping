import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';

part 'my_database.g.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get desc => text()();
  IntColumn get ctime => integer()();
  IntColumn get utime => integer()();
}

@DriftDatabase(tables: [Books])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Selectable<String> getSqliteVersion() {
    return customSelect(
      'select sqlite_version() as c'
    ).map((row) => row.read<String>('c'));
  }
}
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'booking.db'));
    return NativeDatabase(file);
  });
}