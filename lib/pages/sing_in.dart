import 'package:flutter/material.dart';
import 'package:login_navigation/controllers/auth_controller.dart';
import 'package:login_navigation/pages/sign_up.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget{

  final _formKey = GlobalKey<FormState>();
  final emailTextField = TextEditingController();
  final passwordTextField = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
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
                  RaisedButton(
                    onPressed:(){
                      if(_formKey.currentState.validate()){
                        //prov.signin("elmail@gmail.com", "123456");
                        //prov.signin("mieemail@gmail.com", "123456");
                        prov.signin(emailTextField.text, passwordTextField.text);
                      }
                      return null;
                    },
                    child: Text("Sign in"),
                  ),
                  RaisedButton(
                    onPressed:(){
                      Navigator.of(context).pushNamed('/signup');
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