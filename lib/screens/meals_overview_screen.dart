import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/models/family.dart';
import 'package:homemade_user/screens/family_details_screen.dart';
import 'package:homemade_user/screens/search_screen.dart';
// import '../models/families.dart';
import '../widgets/meals_item.dart';
import 'package:provider/provider.dart';
import '../providers/families/families.dart';

class MealsOverviewScreen extends StatefulWidget {
  @override
  _MealsOverviewScreenState createState() => _MealsOverviewScreenState();
}

class _MealsOverviewScreenState extends State<MealsOverviewScreen>
    with SingleTickerProviderStateMixin {
  List<String> imgList = [
    'images/food1.jpg',
    'images/food2.jpg',
    'images/food3.jpg',
    'images/food4.jpg',
  ];
  String searchedItem = '';
  String categoryItem = 'الكل';
  bool menuCheck = false;
  // zero=>filter by rating , one =>filter by distance
  int filterType = 0;
  bool isSearch = false;
  bool isInit = true;
  List<Family> editedList;

  void sortFamilies() {
    if (filterType == 0) {
      editedList
          .sort((family1, family2) => family2.rating.compareTo(family1.rating));
    } else if (filterType == 1) {
      editedList.sort(
          (family1, family2) => family1.distance.compareTo(family2.distance));
    }
  }

  List<String> categories = [
    'الكل',
    'بيتزا',
    'معجنات',
    'حلويات',
    'مأكولات سريعة',
    'مأكولات بحرية',
    'مأكولات لحمية',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<Families>(context, listen: false);
    editedList = provider.items(category: categoryItem);
    sortFamilies();
    return Scaffold(
      bottomNavigationBar: Config.buildBottomNavigationBar(
        mediaQuery: screenSize,
        context: context,
      ),
      appBar: AppBar(
        leading: PopupMenuButton(
          onSelected: (filter) {
            print(filter);
            if (filter == 0) {
              setState(() {
                filterType = 0;
                menuCheck = false;
              });
            } else if (filter == 1) {
              setState(() {
                filterType = 1;
                menuCheck = true;
              });
            }
          },
          icon: Icon(
            FontAwesomeIcons.filter,
            color: Colors.white,
          ),
          itemBuilder: (ctx) => [
            CheckedPopupMenuItem(
              checked: !menuCheck,
              child: Text('حسب التقييم'),
              value: 0,
            ),
            CheckedPopupMenuItem(
              checked: menuCheck,
              child: Text('حسب الأقرب لك'),
              value: 1,
            ),
          ],
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => SearchScreen(),
              ),
            );
          },
          child: Container(
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
                  width: screenSize.width * 0.03,
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
                SizedBox(
                    // width: screenSize.width * 0.4,
                    ),
              ],
            ),
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
        child: SingleChildScrollView(
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
                          settings: RouteSettings(
                            name: 'name',
                            arguments: editedList[i].name,
                          ),
                        ),
                      );
                    },
                    child: MealsItem(
                      shopLogo: editedList[i].imageUrl,
                      title: editedList[i].name,
                      category: editedList[i].category,
                      orderCount: editedList[i].orderCount,
                      directions: editedList[i].distance,
                      rating: editedList[i].rating,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
