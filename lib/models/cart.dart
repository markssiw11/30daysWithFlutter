import 'package:my_app/core/store.dart';
import 'package:my_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;
  final List<num> _itemIds = [];
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
  num getNumberOfProduct (num id) {
    final _listProduct = _itemIds.where((e) => e == id);
    return _listProduct.length;
  }
  void add (Item item) {
    _itemIds.add(item.id);
  }
  void remove (Item item) {
    _itemIds.remove(item.id);
  }
}
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}