import 'package:flutter/foundation.dart';
import 'package:homemade_user/models/product.dart';

import '../../models/product.dart';
import '../../models/product.dart';

class ProductsProvider with ChangeNotifier {
  bool isUrgentOrder = false;
  List<Datum> _items = [
    Datum(
      id: 2,
      name: "وجبة كومبو",
      details: "وجبة كومبو بالسلطة مع الصوص الحار",
      preparationTime: 45,
      price: 50,
      views: 5,
      rate: 0.1000000000000000055511151231257827021181583404541015625,
      typeId: 3,
      categoryId: 4,
      categoryName: "حلويات",
      providerId: 9,
      providerName: "اسرة الصلاح",
      createdAt: "2020-10-26",
      mainAdditions: [
        Addition(
          id: 28,
          name: "بطاطس",
          price: 4,
        ),
      ],
      moreAdditions: [
        Addition(id: 21, name: "كولا", price: 8),
      ],
      images: [
        Image(
          id: 37,
          image:
              "https://i.kelmeten.com/2018/05/file_9.jpg",
        ),
        Image(
          id: 38,
          image:
              "https://i.kelmeten.com/2018/05/file_9.jpg",
        ),
      ],
    ),
    Datum(
      id: 26,
      name: "بيتزا بيبروني",
      details: "بيتزا البيبروني مع الصوص الحار",
      preparationTime: 45,
      price: 50,
      views: 5,
      rate: 0.1000000000000000055511151231257827021181583404541015625,
      typeId: 3,
      categoryId: 4,
      categoryName: "حلويات",
      providerId: 9,
      providerName: "اسرة الصلاح",
      createdAt: "2020-10-26 13:33",
      mainAdditions: [
        Addition(
          id: 28,
          name: "بطاطس",
          price: 4,
        ),
      ],
      moreAdditions: [
        Addition(id: 21, name: "كولا", price: 8),
      ],
      images: [
        Image(
            id: 37,
            image:
                "https://i.kelmeten.com/2018/05/file_9.jpg"),
        Image(
            id: 38,
            image:
                "https://i.kelmeten.com/2018/05/file_9.jpg"),
      ],
    ),
    Datum(
      id: 26,
      name: "بيتزا هت",
      details: "بيتزا البيبروني مع الصوص الحار",
      preparationTime: 45,
      price: 50,
      views: 5,
      rate: 0.1000000000000000055511151231257827021181583404541015625,
      typeId: 3,
      categoryId: 4,
      categoryName: "معجنات",
      providerId: 9,
      providerName: "اسرة الصلاح",
      createdAt: "2020-10-26 13:33",
      mainAdditions: [
        Addition(
          id: 28,
          name: "بطاطس",
          price: 4,
        ),
      ],
      moreAdditions: [
        Addition(id: 21, name: "كولا", price: 8),
      ],
      images: [
        Image(
            id: 37,
            image:
                "https://i.kelmeten.com/2018/05/file_9.jpg"),
        Image(
            id: 38,
            image:
                "https://i.kelmeten.com/2018/05/file_9.jpg"),
      ],
    ),
    Datum(
      id: 26,
      name: "بيتزا",
      details: "بيتزا البيبروني مع الصوص الحار",
      preparationTime: 45,
      price: 50,
      views: 5,
      rate: 0.1000000000000000055511151231257827021181583404541015625,
      typeId: 3,
      categoryId: 4,
      categoryName: "معجنات",
      providerId: 9,
      providerName: "اسرة الصلاح",
      createdAt: "2020-10-26 13:33",
      mainAdditions: [
        Addition(
          id: 28,
          name: "بطاطس",
          price: 4,
        ),
      ],
      moreAdditions: [
        Addition(id: 21, name: "كولا", price: 8),
      ],
      images: [
        Image(
            id: 37,
            image:
                "https://i.kelmeten.com/2018/05/file_9.jpg"),
        Image(
            id: 38,
            image:
                "https://i.kelmeten.com/2018/05/file_9.jpg"),
      ],
    ),
  ];

  List<Datum> get items {
    return [..._items];
  }

  List<Addition> get mainAdditions {
    return _items.map((e) => null).toList();
  }

  void orderType(bool order) {
    isUrgentOrder = order;
    notifyListeners();
  }
}
