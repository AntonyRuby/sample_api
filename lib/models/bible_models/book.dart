import 'abbrev.dart';

class Book {
  Abbrev? abbrev;
  String? name;
  String? author;
  String? group;
  String? version;

  Book({this.abbrev, this.name, this.author, this.group, this.version});

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        abbrev: json['abbrev'] == null
            ? null
            : Abbrev.fromJson(json['abbrev'] as Map<String, dynamic>),
        name: json['name'] as String?,
        author: json['author'] as String?,
        group: json['group'] as String?,
        version: json['version'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'abbrev': abbrev?.toJson(),
        'name': name,
        'author': author,
        'group': group,
        'version': version,
      };
}
