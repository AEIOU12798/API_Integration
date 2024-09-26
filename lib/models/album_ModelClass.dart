class Albums{

  int id;
  int userid;
  String title;

  Albums({
    required this.id,
    required this.userid,
    required this.title,
});

  factory Albums.fromJson(Map<String, dynamic> json){
    return Albums(
        id: json ['id'],
        userid:json ['userId'],
        title:json ['title'],
    );
  }
}