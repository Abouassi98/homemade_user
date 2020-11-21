import 'package:flutter/foundation.dart';

class Cart {
  final String name;
  final String notices;
  final List<String> additional;
  final int price;
  final int quantity;
  Cart({
    @required this.name,
    @required this.notices,
    @required this.additional,
    @required this.price,
    @required this.quantity,
  });
}
