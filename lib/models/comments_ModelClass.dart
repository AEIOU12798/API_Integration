class Comments{

  int id;
  int postId;
  String name;
  String email;
  String body;

  Comments
  ({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comments.fromJson(Map<String, dynamic>json){
    return Comments(
      id: json ['id'],
      postId :json ['postId'],
      name: json ['name'],
      email:json ['email'],
      body: json['body'],
    );
  }
}