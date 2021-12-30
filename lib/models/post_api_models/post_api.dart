class PostApi {
  String? title;
  String? body;
  int? userId;

  PostApi({this.title, this.body, this.userId});

  factory PostApi.fromJson(Map<String, dynamic> json) => PostApi(
        title: json['title'] as String?,
        body: json['body'] as String?,
        userId: json['userId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'userId': userId,
      };
}
