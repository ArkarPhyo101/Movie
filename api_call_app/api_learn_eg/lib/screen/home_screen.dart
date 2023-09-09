import 'package:flutter/material.dart';

import '../model/user.dart';
import '../services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    userCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.red,
        title: const Text('Rest Api Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, index) {
          final user = users[index];
          // final color = user.gender=='male'?Colors.blue:Colors.red;
          return Card(
            child: ListTile(
              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image.network(imageUrl)),
              // tileColor: color,
              title: Text(user.fullname),
              subtitle: Text(user.cell),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: userCall, label: const Text('Click'),
        ),
    );
  }
  Future<void> userCall()  async{
  final responce=await UserApi.userCall();
  setState(() {
    users = responce ;
    });
}

}


 