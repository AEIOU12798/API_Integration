import 'package:api_integration/api_caller.dart';
import 'package:api_integration/api_urls.dart';
import 'package:api_integration/models/comments_ModelClass.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  final CommentsModel=<Comments>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Fetch data when the widget is initialized
    TodosApiCaller().get(ApiUrls.comments).then((response) {
      final dataList = List.from(response); // No need to decode again
      setState(() {
        for (var d in dataList) {
          final model = Comments.fromJson(d);
          CommentsModel.add(model);
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
        title: Center(child: Text('Comments List')),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : CommentsModel.isEmpty
          ? Center(child: Text('No users found.'))
          : ListView.builder(
        itemCount: CommentsModel.length,
        itemBuilder: (context, index) {
          final comments = CommentsModel[index];
          return Card(
            child: ListTile(
              leading: Text(comments.id.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Name :', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(comments.name),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Email Address :', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(comments.email),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Body',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(comments.body),
                      ],
                    ),
                  ],
                ),
              ),


            ),

          );
        },
      ),
    );
  }
}



