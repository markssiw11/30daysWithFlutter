import 'package:flutter/material.dart';
import 'package:my_app/core/store.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: 'Cart'.text.make(),
        ),
        body: Column(
          children: [CartList().p16().expand(), Divider(), _CartTotal()],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    print('re render');
    return SizedBox(
        height: 200,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context,store, status) {
              return "\$${_cart.totalPrice}".text.xl5.make();
            },
          ),
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Not Supported".text.make()));
              },
              child: "Buy".text.make(),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
              ))
        ]));
  }
}

class CartList extends StatelessWidget {
  // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(_cart.items[index].image).wh(50, 50),
                      _cart.items[index].name.text.bold.make()
                    ],
                  ),
                ),
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    // _cart.remove(_cart.items[index]);
                    RemoveMutation(_cart.items[index]);
                  },
                ),
              ),
            ));
  }
}
