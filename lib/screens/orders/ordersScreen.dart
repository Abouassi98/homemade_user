import 'package:flutter/material.dart';
import 'package:homemade_user/config.dart';
import '../../screens/finishOrder/finishOrder.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int list = 3;
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
      ),
      appBar: AppBar(
        title: Text("السلة"),
        centerTitle: true,
        leading: Icon(null),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            child: list == 0
                ? Center(
                    child: Text("السلة فارغة"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: list,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ريال',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '120',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Color.fromRGBO(
                                                56, 104, 118, 1)),
                                      ),
                                    ),
                                    Text(
                                      'اسم الصنف المطلوب',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "الكمية     4",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "الاضافات",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Wrap(
                                    children: [
                                      for (final chip in chips)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: chip,
                                        )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "الملاحظات",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  " الملاحظات الملاحظات الملاحظات الملاحظات الملاحظات الملاحظات",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Text(
                                          "حذف",
                                          
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
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
                      list = 0;
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
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => FinishOrder()));
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
    );
  }
}
