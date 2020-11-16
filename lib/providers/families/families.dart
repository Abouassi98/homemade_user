import 'package:flutter/foundation.dart';
import 'package:homemade_user/models/family.dart';

enum Filtering {
  Rating,
  Distance,
}

class Families with ChangeNotifier {
  Filtering _filtering = Filtering.Rating;

  List<Family> _items = [
    Family(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'أهل الشام',
        category: 'لحم',
        orderCount: 22,
        rating: 5,
        distance: 8),
    Family(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'بيك',
        category: 'معجنات',
        orderCount: 25,
        rating: 4.5,
        distance: 18),
    Family(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'جاد',
        category: 'مأكولات سريعة',
        orderCount: 10,
        rating: 2,
        distance: 14),
    Family(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'أهل الشام',
        category: 'مأكولات بحرية',
        orderCount: 22,
        rating: 3,
        distance: 8),
    Family(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'أهل الشام',
        category: 'حلويات',
        orderCount: 22,
        rating: 3,
        distance: 8),
    Family(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'أهل الشام',
        category: 'مأكولات لحمية',
        orderCount: 22,
        rating: 3,
        distance: 8),
    Family(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'دووم',
        category: 'بيتزا',
        orderCount: 22,
        rating: 3,
        distance: 8),
    Family(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'أهل الشام',
        category: 'لحم',
        orderCount: 22,
        rating: 3,
        distance: 8),
  ];
  List<Family> items({String category}) {
    if (category == 'الكل') {
      return [..._items];
    } else {
      return _items.where((element) => element.category == category).toList();
    }
  }

  List<Family> searchedList(String name) {
    return _items
        .where(
          (element) =>name==null?false: element.name.contains(name),
        )
        .toList();
  }
}
