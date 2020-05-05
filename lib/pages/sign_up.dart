import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/pages/sing_in.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget{

  final _formKey = GlobalKey<FormState>();
  final emailTextField = TextEditingController();
  final passwordTextField = TextEditingController();
  final usernameTextField = TextEditingController();
  final nameTextField = TextEditingController();

  @override
Widget build(BuildContext context) {
    var prov = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child:TextFormField(
                      decoration: const InputDecoration(  
                        labelText: 'Email',  
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      controller: emailTextField,
                    ),
                    height: 45,
                    width: 220,
                  ),
                  SizedBox(
                    child:TextFormField(
                      decoration: const InputDecoration(  
                        labelText: 'Password',  
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      controller: passwordTextField,
                    ),
                    height: 45,
                    width: 220,
                  ),
                  SizedBox(
                    child:TextFormField(
                      decoration: const InputDecoration(  
                        labelText: 'Username',  
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      controller: usernameTextField,
                    ),
                    height: 45,
                    width: 220,
                  ),
                  SizedBox(
                    child:TextFormField(
                      decoration: const InputDecoration(  
                        labelText: 'Name',  
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      controller: nameTextField,
                    ),
                    height: 45,
                    width: 220,
                  ),
                  RaisedButton(
                    onPressed:(){
                      if(_formKey.currentState.validate()){
                        prov.signup(emailTextField.text, passwordTextField.text, usernameTextField.text, nameTextField.text);
                      }
                      return null;
                    },
                    child: Text("Sign up"),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }

}