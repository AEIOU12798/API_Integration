class Posts{

  int id;
  int userId;
  String title;
  String body;

  Posts
      ({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Posts.fromJson(Map<String, dynamic>json){
    return Posts(
      id: json ['id'],
      userId :json ['userId'],
      title:json ['title'],
      body: json['body'],
    );
  }
}