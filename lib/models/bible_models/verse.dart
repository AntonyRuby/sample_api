class Verse {
  int? number;
  String? text;

  Verse({this.number, this.text});

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        number: json['number'] as int?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'text': text,
      };
}
