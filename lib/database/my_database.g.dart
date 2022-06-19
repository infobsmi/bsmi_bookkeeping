// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String title;
  final String desc;
  final int ctime;
  final int utime;
  Book(
      {required this.id,
      required this.title,
      required this.desc,
      required this.ctime,
      required this.utime});
  factory Book.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Book(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc'])!,
      ctime: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ctime'])!,
      utime: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}utime'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['desc'] = Variable<String>(desc);
    map['ctime'] = Variable<int>(ctime);
    map['utime'] = Variable<int>(utime);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
      desc: Value(desc),
      ctime: Value(ctime),
      utime: Value(utime),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      desc: serializer.fromJson<String>(json['desc']),
      ctime: serializer.fromJson<int>(json['ctime']),
      utime: serializer.fromJson<int>(json['utime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'desc': serializer.toJson<String>(desc),
      'ctime': serializer.toJson<int>(ctime),
      'utime': serializer.toJson<int>(utime),
    };
  }

  Book copyWith(
          {int? id, String? title, String? desc, int? ctime, int? utime}) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        ctime: ctime ?? this.ctime,
        utime: utime ?? this.utime,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('ctime: $ctime, ')
          ..write('utime: $utime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, desc, ctime, utime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.desc == this.desc &&
          other.ctime == this.ctime &&
          other.utime == this.utime);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> desc;
  final Value<int> ctime;
  final Value<int> utime;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.desc = const Value.absent(),
    this.ctime = const Value.absent(),
    this.utime = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String desc,
    required int ctime,
    required int utime,
  })  : title = Value(title),
        desc = Value(desc),
        ctime = Value(ctime),
        utime = Value(utime);
  static Insertable<Book> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? desc,
    Expression<int>? ctime,
    Expression<int>? utime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (desc != null) 'desc': desc,
      if (ctime != null) 'ctime': ctime,
      if (utime != null) 'utime': utime,
    });
  }

  BooksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? desc,
      Value<int>? ctime,
      Value<int>? utime}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      ctime: ctime ?? this.ctime,
      utime: utime ?? this.utime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (ctime.present) {
      map['ctime'] = Variable<int>(ctime.value);
    }
    if (utime.present) {
      map['utime'] = Variable<int>(utime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('ctime: $ctime, ')
          ..write('utime: $utime')
          ..write(')'))
        .toString();
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String?> desc = GeneratedColumn<String?>(
      'desc', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ctimeMeta = const VerificationMeta('ctime');
  @override
  late final GeneratedColumn<int?> ctime = GeneratedColumn<int?>(
      'ctime', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _utimeMeta = const VerificationMeta('utime');
  @override
  late final GeneratedColumn<int?> utime = GeneratedColumn<int?>(
      'utime', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, desc, ctime, utime];
  @override
  String get aliasedName => _alias ?? 'books';
  @override
  String get actualTableName => 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('ctime')) {
      context.handle(
          _ctimeMeta, ctime.isAcceptableOrUnknown(data['ctime']!, _ctimeMeta));
    } else if (isInserting) {
      context.missing(_ctimeMeta);
    }
    if (data.containsKey('utime')) {
      context.handle(
          _utimeMeta, utime.isAcceptableOrUnknown(data['utime']!, _utimeMeta));
    } else if (isInserting) {
      context.missing(_utimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Book.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $BooksTable books = $BooksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [books];
}
