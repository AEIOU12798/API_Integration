

class Todos{
  int id;
  int userId;
  String title;
  bool isCompletd;

  Todos({
    required this.id,
    required this.userId,
    required this.title,
    required this.isCompletd,
  });

  factory Todos.fromJson(Map<String, dynamic> json){
    return Todos(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      isCompletd: json['completed'],
    );
  }
}