import '../config.dart';
class Order {
  final String title;
  final String imageUrl;
  final String status;
  final int price;
  final DateTime date;
  final OrderTab orderType;
  Order({
    this.title,
    this.imageUrl,
    this.status,
    this.price,
    this.date,
    this.orderType
  });
}
