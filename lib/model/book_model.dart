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

  const BookModel(
      {required this.id,
      required this.extension,
      required this.size,
      required this.name,
      required this.path,
      });

  @override
  String toString() {
    return 'BookModel{id: ${this.id}, extension:  ${this.extension}, size: ${this.size}, name:  ${this.name}, path:  ${this.path}}';
  }

}

// //
// BookModel copyWith({
//   String? name,
//   String? extension,
//   int? size,
//   String? path,
//   int? id,
// }) {
//   return BookModel(
//     id: id ?? this.id,
//     extension: extension ?? this.extension,
//     size: size ?? this.size,
//     name: name ?? this.name, path: path ?? this.path,);
// }


