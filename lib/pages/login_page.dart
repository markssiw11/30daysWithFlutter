import 'package:flutter/material.dart';
import 'package:my_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              "asserts/images/login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
              child: Text('login form'),
            ),
            Text(
              'Wellcom $name to my app',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'UserName',
                        hintText: "Enter user name here"),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'PassWord',
                        hintText: "Enter pass word here"),
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password lenght should be at least 6';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              
              child: Container(
                child: Text('Login'),
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 32.0),
              ),
              onPressed: () => moveToHome(context)
            ),
          ],
        ),
      )),
    );
  }
}
