import 'package:api_integration/api_caller.dart';
import 'package:api_integration/api_urls.dart';
import 'package:api_integration/models/album_ModelClass.dart';
import 'package:flutter/material.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {

  final albumsModel=<Albums>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Fetch data when the widget is initialized
    TodosApiCaller().get(ApiUrls.todos).then((response) {
      final dataList = List.from(response); // No need to decode again
      setState(() {
        for (var d in dataList) {
          final model = Albums.fromJson(d);
          albumsModel.add(model);
        }
        isLoading = false;
      });
    }).catchError((e) {
      print('Error fetching users: $e');
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Albums List')),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : albumsModel.isEmpty
          ? Center(child: Text('No users found.'))
          : ListView.builder(
        itemCount: albumsModel.length,
        itemBuilder: (context, index) {
          final albums = albumsModel[index];
          return Card(
            child: ListTile(
              leading: Text(albums.id.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              title: Text('Title : ', style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(albums.title),


            ),

          );
        },
      ),
    );
  }
}


