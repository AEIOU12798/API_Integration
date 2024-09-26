class Photos{

  int id;
  int albumId;
  String title;
  String url;
  String thumbnailurl;

   Photos({
    required this.id,
     required this.albumId,
     required this.title,
     required this.url,
     required this.thumbnailurl,
});
   factory Photos.fromJson(Map<String, dynamic>json){
     return Photos(
         id: json ['id'],
         albumId :json ['albumId'],
         title: json ['title'],
         url:json ['url'],
         thumbnailurl: json['thumbnailUrl'],
     );
   }
}