import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  showTheDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Welcome to max!"),
          content: Text("We hope you enjoy our app :)"),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido ${pro.user.Name}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print(pro.user.Name);
          pro.logOut();
        },
        tooltip: 'Increment',
        child: Icon(Icons.exit_to_app),
      ),
    );
  }
  
}