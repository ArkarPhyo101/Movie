import 'package:api_learn_eg/model/user_dob.dart';
import '../model/user.dart';
import '../model/user_name.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class UserApi{
  static Future<List<User>> userCall() async {
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final responce =await http.get(uri);
    final body = responce.body;
    final json = jsonDecode(body);
    final results =json['results'] as List<dynamic>;

    final users = results.map((e) {
      final name = UserName.fromMap(e['name']);

        final dob = UserDob.fromMap(e['dob']);
        return User(
        gender: e['gender'], 
        email: e['email'], 
        phone: e['phone'], 
        cell: e['cell'], 
        nat: e['nat'], 
        name: name, 
        dob: dob);
    }).toList();
    return users;
  }
}