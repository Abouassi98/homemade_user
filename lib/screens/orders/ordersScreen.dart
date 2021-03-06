import 'package:flutter/material.dart';
import 'package:homemade_user/config.dart';
import 'package:homemade_user/screens/driver_search_screen.dart';
import 'package:homemade_user/screens/order_screen.dart';
import 'package:homemade_user/widgets/register_text_field.dart';
import '../finishOrder/finishOrder.dart';
import '../../widgets/cart_item.dart';
import '../../models/cart.dart';

class OrdersScreen extends StatefulWidget {
  final bool hideOptions;
  OrdersScreen({
    this.hideOptions = true,
  });
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int list = 3;

  List<Cart> cartItems = [
    Cart(
      name: 'اسم الصنف المطلوب',
      notices: 'الملاحظات الملاحظات الملاحظات الملاحظات الملاحظات',
      additional: [
        "مخبوزات",
        "حلويات",
        "معجنات",
        "وجبات",
      ],
      price: 20,
      quantity: 4,
    ),
    Cart(
      name: 'اسم الصنف المطلوب',
      notices: 'الملاحظات الملاحظات الملاحظات الملاحظات الملاحظات',
      additional: [
        "مخبوزات",
        "حلويات",
        "معجنات",
        "وجبات",
      ],
      price: 18,
      quantity: 4,
    ),
    Cart(
      name: 'اسم الصنف المطلوب',
      notices: 'الملاحظات الملاحظات الملاحظات الملاحظات الملاحظات',
      additional: [
        "مخبوزات",
        "حلويات",
        "معجنات",
        "وجبات",
      ],
      price: 17,
      quantity: 4,
    ),
    Cart(
      name: 'اسم الصنف المطلوب',
      notices: 'الملاحظات الملاحظات الملاحظات الملاحظات الملاحظات',
      additional: [
        "مخبوزات",
        "حلويات",
        "معجنات",
        "وجبات",
      ],
      price: 15,
      quantity: 4,
    ),
    Cart(
      name: 'اسم الصنف المطلوب',
      notices: 'الملاحظات الملاحظات الملاحظات الملاحظات الملاحظات',
      additional: [
        "مخبوزات",
        "حلويات",
        "معجنات",
        "وجبات",
      ],
      price: 21,
      quantity: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final chips = [
      FilterChip(
        backgroundColor: Color(0xffF3AB93),
        label: Text(
          "مخبوزات",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        selected: false,
        onSelected: (value) {},
      ),
      FilterChip(
        backgroundColor: Color(0xffF3AB93),
        label: Text(
          "حلويات",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        selected: false,
        onSelected: (value) {},
      ),
      FilterChip(
        backgroundColor: Color(0xffF3AB93),
        label: Text(
          "حلويات",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        selected: false,
        onSelected: (value) {},
      ),
    ];
    return Scaffold(
      bottomNavigationBar: Config.buildBottomNavigationBar(
        mediaQuery: mediaQuery,
        context: context,
        isSignup: widget.hideOptions,
      ),
      appBar: AppBar(
        title: Text("السلة"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.57,
              child: cartItems.isEmpty
                  ? Center(
                      child: Text("السلة فارغة"),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: list,
                      itemBuilder: (_, i) {
                        var cart = cartItems[i];
                        return CartItem(
                          name: cart.name,
                          price: cart.price,
                          quantity: cart.quantity,
                          notice: cart.notices,
                          chips: cart.additional
                              .map(
                                (e) => FilterChip(
                                  backgroundColor: Color(0xffF3AB93),
                                  label: Text(
                                    e,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  selected: false,
                                  onSelected: (value) {},
                                ),
                              )
                              .toList(),
                          onDelete: () {
                            setState(() {
                              cartItems.removeAt(i);
                            });
                          },
                          onEdit: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => OrderScreen(
                                  isEdit: true,
                                  sku: 4,
                                ),
                              ),
                            ).then(
                              (value) => Navigator.of(context).pop(),
                            );
                          },
                        );
                      }),
            ),
            SizedBox(
              height: mediaQuery.height * 0.01,
            ),
            if(cartItems.isNotEmpty)
            Container(
              width: mediaQuery.width * 0.8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: mediaQuery.width * 0.66,
                    child: RegisterTextField(
                      label: 'كود الخصم',
                      type: TextInputType.text,
                      onChange: (v) {},
                      hint: 'قم باضافة كود الخصم ...',
                    ),
                  ),
                  Container(
                    width: mediaQuery.width * 0.295,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'التحقق من الكود',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      textColor: Colors.white,
                      onPressed: () {
                        print('sssssss');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ].reversed.toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        cartItems.clear();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffF3AB93),
                      ),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 30,
                      child: Center(
                          child: Text(
                        "افراغ السلة",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                    ),
                  ),
                ),
                if(cartItems.isNotEmpty)
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DriverSearchScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffF3AB93),
                      ),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 30,
                      child: Center(
                          child: Text(
                        "تاكيد الطلب",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
