// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
part 'book_model.g.dart';

@HiveType(typeId: 1)
class BookModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String path;
  @HiveField(3)
  final String extension;
  @HiveField(4)
  final int? size;
  BookModel({
    this.id,
    required this.name,
    required this.path,
    required this.extension,
    this.size,
  });

  BookModel copyWith({
    int? id,
    String? name,
    String? path,
    String? extension,
    int? size,
  }) {
    return BookModel(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
      extension: extension ?? this.extension,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'path': path,
      'extension': extension,
      'size': size,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      path: map['path'] as String,
      extension: map['extension'] as String,
      size: map['size'] != null ? map['size'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) => BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookModel(id: $id, name: $name, path: $path, extension: $extension, size: $size)';
  }

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.path == path &&
      other.extension == extension &&
      other.size == size;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      path.hashCode ^
      extension.hashCode ^
      size.hashCode;
  }
}



