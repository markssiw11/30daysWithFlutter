import 'package:flutter/material.dart';
import 'package:my_app/models/catalog.dart';
import 'package:my_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetailPage extends StatelessWidget {
  final Item catalog;
  const ProductDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          backwardsCompatibility: true,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: productButtonBar(catalog.price, context),
        body: SafeArea(
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  // padding: Vx.,
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold
                          .color(context.accentColor)
                          .make(),
                      catalog.desc.text.make(),
                      catalog.content.text
                          .textStyle(context.captionStyle!)
                          .make()
                          .p16()
                    ],
                  ).pOnly(top: 64),
                ),
              ))
            ],
          ),
        ));
  }
}

Container productButtonBar(num price, BuildContext context) {
  return Container(
    color: context.cardColor,
    child: ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        "\$${price}".text.bold.xl4.red800.make().py8(),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor),
              shape: MaterialStateProperty.all(StadiumBorder())),
          child: "Buy".text.make(),
        ).wh(100, 32)
      ],
    ).p32(),
  );
}
