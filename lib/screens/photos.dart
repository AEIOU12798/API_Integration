import 'package:api_integration/api_caller.dart';
import 'package:api_integration/api_urls.dart';
import 'package:api_integration/models/photos_ModelClass.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {

  final PhotosModel=<Photos>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Fetch data when the widget is initialized
    TodosApiCaller().get(ApiUrls.photos).then((response) {
      final dataList = List.from(response); // No need to decode again
      setState(() {
        for (var d in dataList) {
          final model = Photos.fromJson(d);
          PhotosModel.add(model);
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
        title: Center(child: Text('Photos List')),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : PhotosModel.isEmpty
          ? Center(child: Text('No users found.'))
          : ListView.builder(
        itemCount: PhotosModel.length,
        itemBuilder: (context, index) {
          final photos = PhotosModel[index];
          return Card(
            child: ListTile(
              leading: Text(photos.id.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text('Title :',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text( photos.title),
                  ],
                ),
              ),

              subtitle: Column(
                children: [
                  Text('Image:'),
                  Image.network(photos.url),
                  Text('Thumbnail Image:'),
                  Image.network(photos.thumbnailurl),
                ],
              ),

            ),
            );

        },
      ),
    );
  }
}



