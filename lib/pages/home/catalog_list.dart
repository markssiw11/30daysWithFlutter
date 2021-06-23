import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/models/catalog.dart';
import 'package:my_app/pages/detail/main.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            child: CatalogItem(catalog: catalog),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(catalog: catalog)));
            },
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var captionStyle = context.captionStyle;
    return VxBox(
        child: Row(
      children: [
        Hero(
          child: CatalogImage(image: catalog.image),
          tag: Key(catalog.id.toString()),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalog.name.text.bold.xl.color(context.theme.accentColor).make(),
            catalog.desc.text.textStyle(captionStyle!).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.xl.make().py8(),
                _AddToCartButton(catalog: catalog,)
              ],
            )
          ],
        )),
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCartButton extends StatefulWidget {
  final Item catalog;
  const _AddToCartButton({Key? key, required this.catalog}) : super(key: key);

  @override
  __AddToCartButtonState createState() => __AddToCartButtonState();
}

class __AddToCartButtonState extends State<_AddToCartButton> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
  num numOfProduct = _cart.getNumberOfProduct(widget.catalog.id);
    return ElevatedButton(
      onPressed: () {
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all( numOfProduct > 0 ? Colors.blue : context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder()),
          ),
      child: Container(
        child: numOfProduct > 0 ? numOfProduct.text.make() : Icon(CupertinoIcons.cart_badge_minus).centered(),
      ),
    ).wh(50, 50);
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}
