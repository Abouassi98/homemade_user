import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/models/family.dart';
import 'package:homemade_user/screens/family_details_screen.dart';
import 'package:homemade_user/screens/orders/ordersScreen.dart';
import 'package:homemade_user/screens/search_screen.dart';
// import '../models/families.dart';
import '../widgets/meals_item.dart';
import 'package:provider/provider.dart';
import '../providers/families/families.dart';
import '../widgets/showGeneralDialog.dart';

enum FilterType {
  Rating,
  Nearest,
  MostOrdered,
}

class MealsOverviewScreen extends StatefulWidget {
  final int filterType;
  MealsOverviewScreen({this.filterType});
  @override
  _MealsOverviewScreenState createState() => _MealsOverviewScreenState();
}

class _MealsOverviewScreenState extends State<MealsOverviewScreen>
    with SingleTickerProviderStateMixin {
  FilterType filterType = FilterType.Rating;
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

  bool isSearch = false;
  bool isInit = true;
  List<Family> editedList;

  void sortFamilies() {
    if (filterType == FilterType.Rating) {
      editedList.sort(
        (family1, family2) => family2.rating.compareTo(
          family1.rating,
        ),
      );
    } else if (filterType == FilterType.Nearest) {
      editedList.sort(
        (family1, family2) => family1.distance.compareTo(
          family2.distance,
        ),
      );
    } else if (filterType == FilterType.MostOrdered) {
      editedList.sort(
        (family1, family2) => family2.orderCount.compareTo(
          family1.orderCount,
        ),
      );
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
          padding: EdgeInsets.zero,
          onSelected: (filter) {
            print(filter);
            setState(() {
              filterType = filter;
            });
          },
          icon: Icon(
            FontAwesomeIcons.filter,
            color: Colors.white,
          ),
          itemBuilder: (ctx) => [
            CheckedPopupMenuItem(
              checked: (filterType == FilterType.Rating),
              child: Text('حسب التقييم'),
              value: FilterType.Rating,
            ),
            CheckedPopupMenuItem(
              checked: filterType == FilterType.Nearest,
              child: Text('حسب الأقرب لك'),
              value: FilterType.Nearest,
            ),
            CheckedPopupMenuItem(
              checked: filterType == FilterType.MostOrdered,
              child: Text('حسب الأكثر طلباً'),
              value: FilterType.MostOrdered,
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
            width: screenSize.width,
            height: screenSize.height * 0.06,
            padding: EdgeInsets.only(left: 4, right: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   width: screenSize.width * 0.01,
                //  ),

                Icon(FontAwesomeIcons.search, color: Colors.grey),
                SizedBox(
                  width: screenSize.width * 0.35,
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
        ),
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.shoppingCart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => OrdersScreen(hideOptions: false,)));
            },
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
                  // autoplay: false,
                  images: [
                    AssetImage("images/food1.jpg"),
                    AssetImage("images/food2.jpg"),
                    AssetImage("images/food3.jpg"),
                    AssetImage("images/food4.jpg"),
                  ],
                ),
              ),
              Container(
                height: screenSize.height * 0.08,
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
                height: screenSize.height * 0.51,
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
                      if (i < 6) {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => FamilyDetailsScreen(filterType: widget.filterType),
                            settings: RouteSettings(
                              name: 'name',
                              arguments: editedList[i].name,
                            ),
                          ),
                        );
                      } else {
                        GeneraDialog().show(
                            context,
                            Material(
                              child: Container(
                                height: screenSize.height * 0.3,
                                width: screenSize.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: screenSize.height * 0.05,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(
                                        12.0,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'الأسرة غير متاحة',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: screenSize.height * 0.06,
                                            width: screenSize.width * 0.37,
                                            child: RaisedButton(
                                              elevation: 8,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'موافق',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              textColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenSize.width * 0.03,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      }
                    },
                    child: MealsItem(
                      isAvailable: i<6?true:false,
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
