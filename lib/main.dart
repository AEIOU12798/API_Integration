
import 'package:flutter/material.dart';

import 'screens/albums.dart';
import 'screens/comments.dart';
import 'screens/photos.dart';
import 'screens/posts.dart';
import 'screens/todos.dart';
import 'screens/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Center(child: Text('Json Placeholder Data'))),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 100.0),
            child: Column(
              children: [
                ElevatedButton(
                    style:ButtonStyle(
                        elevation: WidgetStatePropertyAll(8.0),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ))
                    ),
                    child: Text('Users Data'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UsersPage()));
                    }
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    style:ButtonStyle(
                        elevation: WidgetStatePropertyAll(8.0),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ))
                    ),
                    child: Text('Posts'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostsPage()));
                    }
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    style:ButtonStyle(
                        elevation: WidgetStatePropertyAll(8.0),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ))
                    ),
                    child: Text('Todos'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TodosPage()));
                    }
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    style:ButtonStyle(
                        elevation: WidgetStatePropertyAll(8.0),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ))
                    ),
                    child: Text('ALbums'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AlbumsPage()));
                    }
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    style:ButtonStyle(
                        elevation: WidgetStatePropertyAll(8.0),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ))
                    ),
                    child: Text('Photos'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PhotosPage()));
                    }
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    style:ButtonStyle(
                        elevation: WidgetStatePropertyAll(8.0),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ))
                    ),
                    child: Text('Comments'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CommentsPage()));
                    }
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

