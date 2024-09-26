import 'package:api_integration/api_caller.dart';
import 'package:api_integration/api_urls.dart';
import 'package:api_integration/models/posts_ModelClass.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  final PostsModel=<Posts>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Fetch data when the widget is initialized
    TodosApiCaller().get(ApiUrls.posts).then((response) {
      final dataList = List.from(response); // No need to decode again
      setState(() {
        for (var d in dataList) {
          final model = Posts.fromJson(d);
          PostsModel.add(model);
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
        title: Center(child: Text('Posts List')),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : PostsModel.isEmpty
          ? Center(child: Text('No users found.'))
          : ListView.builder(
        itemCount: PostsModel.length,
        itemBuilder: (context, index) {
          final posts = PostsModel[index];
          return Card(
            child: ListTile(
              leading: Text(posts.id.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              title: Text(posts.title , style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(posts.body),


            ),

          );
        },
      ),
    );
  }
}



