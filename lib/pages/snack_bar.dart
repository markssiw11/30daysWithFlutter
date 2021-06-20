import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('snack'),
            duration: const Duration(seconds: 1),
            action: SnackBarAction(
              label: 'ACTION',
              onPressed: () {},
            ),
          ));
        },
        child: const Text('SHOW SNACK'),
      ),
    );
  }
}
