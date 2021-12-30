class Abbrev {
  String? pt;
  String? en;

  Abbrev({this.pt, this.en});

  factory Abbrev.fromJson(Map<String, dynamic> json) => Abbrev(
        pt: json['pt'] as String?,
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'pt': pt,
        'en': en,
      };
}
