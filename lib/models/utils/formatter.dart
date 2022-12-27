import 'package:intl/intl.dart';

class Formatter {
  static String getFormattedPrice(int price, {bool addPkr = true}) {
    var formatter = NumberFormat("#,##,###", "en_US");
    final text = formatter.format(price);
    if (addPkr) return 'PKR $price';

    return text;
  }
}
