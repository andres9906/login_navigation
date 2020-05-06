import 'dart:convert';
import 'package:login_navigation/models/user.dart';
import 'package:http/http.dart' as http; 

class Webservice {

  Future<User> signIn(String email, String password) async {
    final response = await http.post('https://movil-api.herokuapp.com/signin',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,'password': password
      }),
    );
    
    if (response.statusCode == 200) {
      print('${response.body}');
      print('allesokSignInBaby');
      return User.fromJson(json.decode(response.body));
    } else {
      print("signup failed");
      print('${response.body}');
      return null;
      //throw Exception(response.body);
    }
  }

  Future<User> signUp(String email, String password, String username, String name) async {
    final response = await http.post(
      'https://movil-api.herokuapp.com/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,'password': password,'username': username,'name': name
      }),
    );

    if (response.statusCode == 200) {
      print('${response.body}');
      print('allesokbaby UP');
      return User.fromJson(json.decode(response.body));
    } else {
      print("signup failed");
      print('${response.body}');
      //throw Exception(response.body);
      return null;
    }


  }
  

}








