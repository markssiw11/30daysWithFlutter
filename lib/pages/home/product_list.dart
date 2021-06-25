import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/store.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/pages/detail/product_detail.dart';
import 'package:my_app/utils/format_monet.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

final oCcy = new NumberFormat(
  "#,##0",
  "vi_VN",
);

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ProductModel.items.length,
        itemBuilder: (context, index) {
          final product = ProductModel.items[index];
          return InkWell(
            child: ProductItem(product: product),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(product: product)));
            },
          );
        });
  }
}

class ProductItem extends StatelessWidget {
  final Item product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String price = formatMoney(product.price);

    return VxBox(
        child: Row(
      children: [
        Hero(
          child: CatalogImage(image: product.imgUrl),
          tag: Key(product.id.toString()),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product.name.text.xs.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                price.text.bold.xs.make().py8(),
                _AddToCartButton(
                  catalog: product,
                )
              ],
            )
          ],
        )),
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCartButton extends StatelessWidget {
  final Item catalog;
  const _AddToCartButton({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    num numOfProduct = _cart.getNumberOfProduct(catalog.id);
    return ElevatedButton(
      onPressed: () {
        // _cart.catalog = _catalog;
        // _cart.add(catalog);
        // AddMutation(catalog);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            numOfProduct > 0 ? Colors.blue : context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: Container(
        child: numOfProduct > 0
            ? numOfProduct.text.make()
            : Icon(CupertinoIcons.cart_badge_minus).centered(),
      ),
    ).wh(60, 30);
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: image,
            width: 100,
            height: 100,
          )),
    );
  }
}
