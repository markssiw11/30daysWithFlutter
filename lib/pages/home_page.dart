import 'package:flutter/material.dart';
import 'package:my_app/models/catalog.dart';
import 'package:my_app/widgets/drawer.dart';
import 'package:my_app/widgets/item_widgets.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  final dumList = List.generate(4, (index) => CatalogModel.items[0]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            // padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: dumList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemWidgets(item: dumList[index]);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: null,
      ),
      drawer: MyDrawer(),
    );
  }

  Widget buttonSection = Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        // border: Border.all(width: 10, color: Colors.black38),
        borderRadius: const BorderRadius.all(const Radius.circular(20)),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue[500], Icons.call, 'CALL'),
          _buildButtonColumn(Colors.blue[500], Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Colors.blue[500], Icons.share, 'SHARE'),
        ],
      ));
}

Widget floatButton = Container(
  height: 50.0,
  padding: const EdgeInsets.all(8.0),
  margin: const EdgeInsets.symmetric(horizontal: 8.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    color: Colors.lightGreen[500],
  ),
  child: Center(
    child: Text('Engage'),
  ),
);

Widget titleSection = Container(
  padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              // padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('41'),
    ],
  ),
);

Column _buildButtonColumn(Color? color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: color),
        ),
      )
    ],
  );
}
