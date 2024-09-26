import 'package:api_integration/api_caller.dart';
import 'package:api_integration/api_urls.dart';
import 'package:api_integration/models/todos_ModelClass.dart';
import 'package:flutter/material.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {

  final TodosModel=<Todos>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Fetch data when the widget is initialized
    TodosApiCaller().get(ApiUrls.todos).then((response) {
      final dataList = List.from(response); // No need to decode again
      setState(() {
        for (var d in dataList) {
          final model = Todos.fromJson(d);
          TodosModel.add(model);
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
        title: Center(child: Text('Todos List')),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : TodosModel.isEmpty
          ? Center(child: Text('No users found.'))
          : ListView.builder(
        itemCount: TodosModel.length,
        itemBuilder: (context, index) {
          final todos = TodosModel[index];
          return Card(
            child: ListTile(
              leading: Text(todos.id.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              title: Text( '${todos.title}', style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: Text(todos.isCompletd.toString()),

            ),

          );
        },
      ),
    );
  }
}


