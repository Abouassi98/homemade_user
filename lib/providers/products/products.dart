import 'package:flutter/foundation.dart';
import 'package:homemade_user/models/product.dart';

import '../../models/product.dart';
import '../../models/product.dart';

class Products with ChangeNotifier {
  bool isUrgentOrder=false;
  List<Product> _items = [
    Product(
      productId: 12,
      description: 'بيتزا جامبو مع بيبسي وفراخ',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'بيتزا هت',
      rating: 4,
      productType: ProductType.Urgent,
      category: 'معجنات',
    ),
    Product(
      productId: 12,
      description: 'شعرية سريعة التحضير لكل الناس',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'اندومي',
      rating: 4,
      productType: ProductType.Scheduled,
      category: 'باستا',
    ),
    Product(
      productId: 12,
      description:
          'الأكلات السعودية ويصنع من الأرز',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'سليق',
      rating: 4,
      productType: ProductType.Scheduled,
      category: 'وجبات',
    ),
    Product(
      productId: 12,
      description:
          'الأكلة الشعبية السعودية الأساسية',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'الفريك',
      rating: 4,
      productType: ProductType.Urgent,
      category: 'مشويات',
    ),
    Product(
      productId: 13,
      description: 'كنافة عربي لفطار لذيذ',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'كنافة نابلسي',
      rating: 3,
      productType: ProductType.Urgent,
      category: 'حلويات',
    ),
    Product(
      productId: 13,
      description:
          'عصيدة الموز والخبز مع العسل والمكسرات،',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'المعصوب',
      rating: 3,
      productType: ProductType.Urgent,
      category: 'وجبات',
    ),
    Product(
      productId: 13,
      description:
          ' الأكلات السعودية المشهورة',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'الحنيذ',
      rating: 3,
      productType: ProductType.Scheduled,
      category: 'لحم',
    ),
    Product(
      productId: 13,
      description: 'كنافة عربي لفطار لذيذ',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'كنافة',
      rating: 3,
      productType: ProductType.Scheduled,
      category: 'حلويات',
    ),
   
    Product(
      productId: 14,
      description: 'وجبة عربية لحم وفراخ وبيبسي',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'وجبة ميكس عربي',
      rating: 4.5,
      productType: ProductType.Scheduled,
      category: 'وجبات',
    ),
    Product(
      productId: 14,
      description: 'وجبة كومبو سبايسي',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'كومبو',
      rating: 4.5,
      productType: ProductType.Scheduled,
      category: 'وجبات',
    ),
    Product(
      productId: 15,
      description: 'كب كيك بنكهة الريدفيلفيت',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'كب كيك',
      rating: 3.5,
      productType: ProductType.Urgent,
      category: 'كب كيك',
    ),
    Product(
      productId: 15,
      description: 'مجموعة من اشهى الحلويات',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'حلويات عربي',
      rating: 3.5,
      productType: ProductType.Urgent,
      category: 'حلويات',
    ),
    Product(
      productId: 15,
      description: 'بيتزا جمبري وعصير فريش',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'بيتزا',
      rating: 3.5,
      productType: ProductType.Scheduled,
      category: 'معجنات',
    ),
    Product(
      productId: 15,
      description: 'كريسبي مع كول سلو وسلطة وبيبسي',
      imageUrl: 'images/food1.jpg',
      price: 15,
      productName: 'دجاج كريسبي',
      rating: 3.5,
      productType: ProductType.Scheduled,
      category: 'وجبات',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }
  void orderType(bool order){
    isUrgentOrder = order;
    notifyListeners();
  }
}
