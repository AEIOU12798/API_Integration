import 'package:api_integration/api_caller.dart';
import 'package:api_integration/models/users_ModelClass.dart';
import 'package:flutter/material.dart';
import 'package:api_integration/api_urls.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final List<User> userModel = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Fetch data when the widget is initialized
    UsersApiCaller().get(ApiUrls.users).then((response) {
      final dataList = List.from(response); // No need to decode again
      setState(() {
        for (var d in dataList) {
          final model = User.fromJson(d);
          userModel.add(model);
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
        title: Center(child: Text('Users')),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : userModel.isEmpty
          ? Center(child: Text('No users found.'))
          : ListView.builder(
        itemCount: userModel.length,
        itemBuilder: (context, index) {
          final user = userModel[index];
          return Card(
            child: ListTile(
              leading: Text(user.id.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              // title: Text(user.name),
              // subtitle: Text(user.email),
              // trailing: Text(user.address.city),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Name : ', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(user.name),
                      ],
                    ),
                    Row(
                      children: [
                        Text('UserNames : ', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(user.userName),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Email Address : ', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(user.email),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Phone No  : ', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(user.phone),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Web URL : ', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(user.website),
                      ],
                    ),
                    Text('Address:',style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.only(left: 60.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Street : ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(user.address.street),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Suite : ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(user.address.suite),
                            ],
                          ),
                          Row(
                            children: [
                              Text('City: ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(user.address.city),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Zipcode: ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(user.address.zipcode),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text('Geo',style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.only(left: 60.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Latitude : ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(user.address.geo.lat),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Longitude : ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(user.address.geo.lng),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text('Company:',style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.only(left: 60.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Name : ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(user.company.name),
                            ],
                          ),
                          Row(
                            children: [
                              Text('CatchPhrase : ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(user.company.catchPhrase),
                            ],
                          ),
                          Row(
                            children: [
                              Text('BS : ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(user.company.bs),
                            ],
                          ),
                        ],
                      ),
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
