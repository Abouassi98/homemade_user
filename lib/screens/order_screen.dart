import 'package:flutter/material.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/screens/driver_search_screen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import '../widgets/checkboxlisttile_item.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar:
          Config.buildBottomNavigationBar(mediaQuery: mediaQuery),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Typicons.shopping_cart,
                size: 30, color: Theme.of(context).primaryColor),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 8,
      ),
      extendBodyBehindAppBar: true,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
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
              top: mediaQuery.height * 0.31,
              right: mediaQuery.width * 0.05,
              left: mediaQuery.width * 0.05,
              // bottom: 0,
              child: Container(
                height: mediaQuery.height * 0.2,
                width: mediaQuery.width * 0.55,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'اسم المنتج',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff366775),
                            fontSize: 20,
                          ),
                        ),
                        SmoothStarRating(
                          color: Color(0xffFFC757),
                          size: 15,
                          isReadOnly: false,
                          rating: 4.5,
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: mediaQuery.width * 0.3,
                      child: Card(
                        color: Color(0xffF4AC94),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'السعر: ${(100 * quantity)} ريال',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'HomeMade',
                              color: Color(0xff366775),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: mediaQuery.height * 0.38,
              bottom: 0,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        height: mediaQuery.height * 0.15,
                        width: mediaQuery.width,
                        color: Color(0xffFCE8E6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الوصف: كب كيك بنكهة الريد فيلفيت',
                              maxLines: null,
                              style: TextStyle(
                                color: Color(0xff366775),
                              ),
                            ),
                            Text(
                              'مدة التحضير: ١ ساعة',
                              style: TextStyle(
                                color: Color(0xff366775),
                              ),
                            ),
                            Text(
                              'الحالة: متوفر',
                              maxLines: null,
                              style: TextStyle(
                                color: Color(0xff366775),
                              ),
                            ),
                            Text(
                              'عدد الطلبات: 40 طلب',
                              maxLines: null,
                              style: TextStyle(
                                color: Color(0xff366775),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        height: mediaQuery.height * 0.18,
                        width: mediaQuery.width * 0.7,
                        color: Color(0xffA2B4C0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'إضافات أساسية :',
                              maxLines: null,
                              style: TextStyle(
                                color: Color(0xff366775),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //  CheckBoxListTileItem(
                            //    title: 'اضافة',

                            //  ),
                            Expanded(
                              child: GridView.builder(
                                physics: ScrollPhysics(
                                  parent: NeverScrollableScrollPhysics(),
                                ),
                                padding: EdgeInsets.all(7),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 3.4,
                                        mainAxisSpacing: 0,
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 0),
                                itemCount: 6,
                                itemBuilder: (ctx, i) => CheckBoxListTileItem(
                                  title: 'اضافة عنصر',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        height: mediaQuery.height * 0.18,
                        width: mediaQuery.width * 0.7,
                        color: Color(0xffA2B4C0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'إضافات جانبية :',
                              maxLines: null,
                              style: TextStyle(
                                color: Color(0xff366775),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //  CheckBoxListTileItem(
                            //    title: 'اضافة',

                            //  ),
                            Expanded(
                              child: GridView.builder(
                                physics: ScrollPhysics(
                                  parent: NeverScrollableScrollPhysics(),
                                ),
                                padding: EdgeInsets.all(7),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 3.4,
                                        mainAxisSpacing: 0,
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 0),
                                itemCount: 6,
                                itemBuilder: (ctx, i) => CheckBoxListTileItem(
                                  title: 'اضافة عنصر',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        height: mediaQuery.height * 0.08,
                        width: mediaQuery.width * 0.7,
                        color: Color(0xffA2B4C0),
                        child: Row(
                          children: [
                            //product quantity
                            Row(
                              children: [
                                Text(
                                  'الكمية :',
                                  style: TextStyle(
                                    color: Color(0xff366775),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: mediaQuery.width * 0.58,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Container(
                                    height: mediaQuery.height * 0.04,
                                    width: mediaQuery.width * 0.06,
                                    color: Color(0xffD66D50),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: mediaQuery.width * 0.01,
                                ),
                                Container(
                                  height: mediaQuery.height * 0.04,
                                  width: mediaQuery.width * 0.09,
                                  color: Colors.white,
                                  child: Center(
                                      child: Text(
                                    '$quantity',
                                    style: TextStyle(
                                      color: Color(0xff366775),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                                SizedBox(
                                  width: mediaQuery.width * 0.01,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (quantity != 1) {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: mediaQuery.height * 0.04,
                                    width: mediaQuery.width * 0.06,
                                    color: Color(0xffD66D50),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        height: mediaQuery.height * 0.14,
                        width: mediaQuery.width * 0.7,
                        color: Color(0xffA2B4C0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'الملاحظات:',
                              maxLines: null,
                              style: TextStyle(
                                color: Color(0xff366775),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.height * 0.01,
                            ),
                            //  CheckBoxListTileItem(
                            //    title: 'اضافة',

                            //  ),
                            Expanded(
                              child: TextField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      Center(
                        child: Container(
                          width: mediaQuery.width * 0.3,
                          decoration: BoxDecoration(),
                          child: RaisedButton(
                            elevation: 8,
                            color: Color(0xffF3AB93),
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      DriverSearchScreen(),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text('أضف للسلة'),
                            textColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
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
