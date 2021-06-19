import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            'Wellcom to my app',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'UserName', hintText: "Enter user name here"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'PassWord', hintText: "Enter pass word here"),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            child: Text('Login'),
            onPressed: () => {},
            style: TextButton.styleFrom(),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: null,
      ),
      drawer: Drawer(),
    );
  }
}
