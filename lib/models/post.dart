class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"] == null ? null : json["userId"] as int,
        id: json["id"] == null ? null : json["id"] as int,
        title: json["title"] == null ? null : json["title"] as String,
        body: json["body"] == null ? null : json["body"] as String,
      );

  Map<String, dynamic> toJson() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
      };
}
