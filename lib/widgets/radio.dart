import 'package:flutter/material.dart';
import 'package:my_app/models/product.dart';
import 'package:velocity_x/velocity_x.dart';

enum SingingCharacter { lafayette, jefferson }

/// This is the stateful widget that the main application instantiates.
class MyRadio extends StatefulWidget {
  final List <OptionProduct> products;
  const MyRadio({Key? key, required this.products}) : super(key: key);

  @override
  State<MyRadio> createState() => MyRadioState();
}

/// This is the private State class that goes with MyRadio.
class MyRadioState extends State<MyRadio> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    final List<OptionProduct> products = widget.products;
    return Column(
      children: <Widget>[
        for (int i = 0; i < products.length; i++)
          ListTile(
            title: 'Mua ${products[i].quantity} sản phẩm, Tặng kèm ${products[i].giftName}'.text.xs.color(Colors.blueAccent).make(),

            leading: Radio(
              value: i,
              groupValue: _value,
              activeColor: Color(0xFF6200EE),
              onChanged: ( value) {
                setState(() {
                  _value = i;
                });
              },
            ),
          ),
      ],
    );
  }
}
