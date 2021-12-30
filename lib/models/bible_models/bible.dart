import 'book.dart';
import 'chapter.dart';
import 'verse.dart';

class Bible {
  Book? book;
  Chapter? chapter;
  List<Verse>? verses;

  Bible({this.book, this.chapter, this.verses});

  factory Bible.fromJson(Map<String, dynamic> json) => Bible(
        book: json['book'] == null
            ? null
            : Book.fromJson(json['book'] as Map<String, dynamic>),
        chapter: json['chapter'] == null
            ? null
            : Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
        verses: (json['verses'] as List<dynamic>?)
            ?.map((e) => Verse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'book': book?.toJson(),
        'chapter': chapter?.toJson(),
        'verses': verses?.map((e) => e.toJson()).toList(),
      };
}
