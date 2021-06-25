import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/widgets/html_widget.dart';
import 'package:my_app/widgets/radio.dart';
import 'package:velocity_x/velocity_x.dart';


class ProductDetailPage extends StatelessWidget {
  final Item product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          backwardsCompatibility: true,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: productButtonBar(0, context),
        body: SafeArea(
          child: SingleChildScrollView(
            // clipBehavior: Clip.antiAlias,
            controller: _scrollController,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                children: [
                  Hero(
                    tag: Key(product.id.toString()),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          imageUrl: product.imgUrl,
                          width: context.percentHeight * 32,
                          height: context.percentHeight * 32,
                        )),
                  ),
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
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          product.name.text.bold
                              .color(context.accentColor)
                              .make()
                              .centered(),
                          if (product.options.length > 0)
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Ưu đãi: "
                                      .text
                                      .bold
                                      .make()
                                      .pOnly(top: 32, bottom: 10, left: 32),
                                  MyRadio(
                                    products: product.options,
                                  ),
                                ],
                              ),
                            ),
                          if (product.description.isNotEmpty)
                            Expanded(child: myHtmlWidget(product.description))
                        ],
                      ).pOnly(top: 64),
                    ),
                  ))
                ],
              ),
            ),
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
        ).wh(100, 32),
      ],
    ).p32(),
  );
}

// image container with boder radius
// child: Container(
//   height: context.percentHeight * 32,
//   width: context.percentHeight * 32,
//   decoration: BoxDecoration(
//     image: DecorationImage(
//         fit: BoxFit.cover,
//         image: NetworkImage(product.imgUrl)),
//     borderRadius: BorderRadius.all(Radius.circular(16.0)),
//     color: Colors.grey,
//   ),
// )