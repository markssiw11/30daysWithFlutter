
import 'package:my_app/models/cart.dart';
import 'package:my_app/models/catalog.dart';
import 'package:my_app/models/product.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late ProductModel product;
  late CartModel cart;
  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }

}