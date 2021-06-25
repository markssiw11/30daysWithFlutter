import 'package:intl/intl.dart';


String formatMoney( money) {
    final oCcy = new NumberFormat("#,##0", "vi_VN", );
    int priceInt = int.parse(money);
    String price = oCcy.format(priceInt);
    String currency = oCcy.currencySymbol;
    return "$price $currency";
}