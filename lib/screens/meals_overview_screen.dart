import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:homemade_user/screens/family_details_screen.dart';
import '../models/families.dart';
import '../widgets/meals_item.dart';

class MealsOverviewScreen extends StatefulWidget {
  @override
  _MealsOverviewScreenState createState() => _MealsOverviewScreenState();
}

class _MealsOverviewScreenState extends State<MealsOverviewScreen>
    with SingleTickerProviderStateMixin {
  // var _tabController = TabController(initialIndex: 4,length: 3);
  List<String> categories = [
    'الكل',
    'بيتزا',
    'معجنات',
    'حلويات',
    'مأكولات سريعة',
    'مأكولات بحرية',
    'مأكولات لحمية',
  ];
  List<Families> familyShop = [
    Families(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'أهل الشام',
        category: 'لحم',
        orderCount: 22,
        rating: 3,
        directions: 8),
    Families(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'بيك',
        category: 'معجنات',
        orderCount: 25,
        rating: 4.5,
        directions: 18),
    Families(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'جاد',
        category: 'مأكولات سريعة',
        orderCount: 10,
        rating: 2,
        directions: 14),
    Families(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'أهل الشام',
        category: 'مأكولات بحرية',
        orderCount: 22,
        rating: 3,
        directions: 8),
    Families(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'أهل الشام',
        category: 'حلويات',
        orderCount: 22,
        rating: 3,
        directions: 8),
    Families(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'أهل الشام',
        category: 'مأكولات لحمية',
        orderCount: 22,
        rating: 3,
        directions: 8),
    Families(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'دووم',
        category: 'بيتزا',
        orderCount: 22,
        rating: 3,
        directions: 8),
    Families(
        imageUrl: 'images/homemade_logo.PNG',
        name: 'أهل الشام',
        category: 'لحم',
        orderCount: 22,
        rating: 3,
        directions: 8),
  ];
  List<String> imgList = [
    'images/food1.jpg',
    'images/food2.jpg',
    'images/food3.jpg',
    'images/food4.jpg',
  ];
  String categoryItem = 'حلويات';
  @override
  Widget build(BuildContext context) {
    List<Families> editedList = familyShop.where((element) {
      if (categoryItem == 'الكل') {
        return true;
      } else if (element.category == categoryItem) {
        return true;
      }
      return false;
    }).toList();

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.filter,
              color: Colors.white,
            ),
            onPressed: null),
        title: Container(
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.06,
          // padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenSize.width * 0.05,
              ),
              Icon(FontAwesomeIcons.search, color: Colors.grey),
              SizedBox(
                width: screenSize.width * 0.4,
              ),
              Text(
                'البحث',
                style: TextStyle(
                  color: Color(0xff366775),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.shoppingCart,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            //show image slider
            Container(
              height: screenSize.height * 0.2,
              child: Carousel(
                
                boxFit: BoxFit.cover,
                dotColor: Color(0xffF4AC94).withOpacity(0.8),
                dotSize: 5.5,
                dotSpacing: 16.0,
                dotBgColor: Colors.transparent,
                showIndicator: true,
                overlayShadow: true,
                autoplay: false,
                images: [
                  AssetImage("images/food1.jpg"),
                  AssetImage("images/food2.jpg"),
                  AssetImage("images/food3.jpg"),
                  AssetImage("images/food4.jpg"),
                ],
              ),
            ),
            Container(
              height: screenSize.height * 0.07,
              width: screenSize.width,
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
            Container(
              height: screenSize.height * 0.61,
              width: screenSize.width,
              child: ListView.builder(
                padding: EdgeInsets.only(
                  top: 2,
                  bottom: 3,
                ),
                itemCount: editedList.length,
                itemBuilder: (ctx, i) => InkWell(
                  splashColor: Color(0xffFCE8E6),
                  onTap: () {
                    print('ss');
                     Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => FamilyDetailsScreen(),
                          settings: RouteSettings(name: 'name',arguments: editedList[i].name,),
                          ),
                          
                        );
                  },
                  child: MealsItem(
                      shopLogo: editedList[i].imageUrl,
                      title: editedList[i].name,
                      category: editedList[i].category,
                      orderCount: editedList[i].orderCount,
                      directions: editedList[i].directions,
                      rating: editedList[i].rating),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
