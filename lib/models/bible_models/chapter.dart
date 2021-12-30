class Chapter {
  int? number;
  int? verses;

  Chapter({this.number, this.verses});

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        number: json['number'] as int?,
        verses: json['verses'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'verses': verses,
      };
}
