import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../widgets/product_item.dart';

class FamilyDetailsScreen extends StatefulWidget {
  @override
  _FamilyDetailsScreenState createState() => _FamilyDetailsScreenState();
}

class _FamilyDetailsScreenState extends State<FamilyDetailsScreen> {
  String name;
  var isInit = true;
  List<String> categories = [
    'الكل',
    'كب كيك',
    'شعرية',
    'كنافة',
    'فطار',
  ];
  String categoryItem = 'الكل';
  List<Product> myProducts = [
    Product(
        description: 'شعرية سريعة التحضير لكل الناس',
        imageUrl: 'images/food1.jpg',
        price: 15,
        productName: 'اندومي',
        rating: 4),
    Product(
        description: 'كنافة عربي لفطار لذيذ',
        imageUrl: 'images/food1.jpg',
        price: 15,
        productName: 'كنافة نابلسي',
        rating: 3),
    Product(
        description: 'فطار مصري للصغار والشطار',
        imageUrl: 'images/food1.jpg',
        price: 15,
        productName: 'فول مصري',
        rating: 4.5),
    Product(
        description: 'كب كيك بنكهة الريدفيلفيت',
        imageUrl: 'images/food1.jpg',
        price: 15,
        productName: 'كب كيك',
        rating: 3.5),
  ];

  @override
  Widget build(BuildContext context) {
    List<Product> editedList = myProducts.where((element) {
      if (element.description.contains(categoryItem)) {
        print('hi');
        return true;
      }
      if (categoryItem == 'الكل') {
        return true;
      }
      return false;
    }).toList();
    print(editedList.length);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Positioned(
              top: mediaQuery.height * 0.03,
              left: mediaQuery.width * 0.01,
              right: mediaQuery.width * 0.01,
              child: ListTile(
                leading: IconButton(
                  icon:
                      Icon(Icons.shopping_cart, size: 30, color: Colors.white),
                  onPressed: () {},
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  'images/food1.jpg',
                  fit: BoxFit.fill,
                  height: mediaQuery.height * 0.3,
                ),
              ),
            ),
            Positioned(
              top: mediaQuery.height * 0.2,
              right: mediaQuery.height * 0.01,
              child: Container(
                height: mediaQuery.height * 0.2,
                width: mediaQuery.width * 0.4,
                child: Card(
                  color: Colors.transparent,
                  elevation: 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'images/homemade_logo.PNG',
                      fit: BoxFit.cover,
                      height: mediaQuery.height * 0.3,
                      width: mediaQuery.width * 0.3,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: mediaQuery.height * 0.25,
              right: mediaQuery.height * 0.26,
              left: mediaQuery.height * 0.02,
              child: Container(
                height: mediaQuery.height * 0.2,
                width: mediaQuery.width * 0.55,
                child: Row(
                  children: [
                    Text(
                      'اسم المتجر',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff366775),
                      ),
                    ),
                    Spacer(),
                    SmoothStarRating(
                      size: 15,
                      isReadOnly: false,
                      rating: 4.5,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: mediaQuery.height * 0.42,
              child: Container(
                padding: EdgeInsets.all(12),
                height: mediaQuery.height * 0.15,
                width: mediaQuery.width,
                color: Color(0xffFCE8E6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الوصف: متجر يقدم انواع مختلفة من الحلويات و الكيك لجميع المناسبات',
                      maxLines: null,
                      style: TextStyle(
                        color: Color(0xff366775),
                      ),
                    ),
                    Text(
                      'أوقات العمل: ٠٠:٧ صباحا - ٠٠:١١ مساءا',
                      style: TextStyle(
                        color: Color(0xff366775),
                      ),
                    ),
                    Text(
                      'الحالة: مفتوح',
                      maxLines: null,
                      style: TextStyle(
                        color: Color(0xff366775),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: mediaQuery.height * 0.57,
              right: 0,
              left: 0,
              child: Container(
                height: mediaQuery.height * 0.07,
                width: mediaQuery.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (ctx, i) => GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryItem = categories[i];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: categoryItem == categories[i]
                            ? Color(0xffF4AC94)
                            : null,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        categories[i],
                        style: TextStyle(color: Color(0xff366775)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: mediaQuery.height * 0.64,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                height: mediaQuery.height * 0.61,
                width: mediaQuery.width,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: 2,
                    bottom: 3,
                  ),
                  itemCount: editedList.length,
                  itemBuilder: (ctx, i) => InkWell(
                    splashColor: Color(0xffFCE8E6),
                    onTap: () {},
                    child: ProductItem(
                      description: editedList[i].description,
                      price: editedList[i].price,
                      prodTitle: editedList[i].productName,
                      rating: editedList[i].rating,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
