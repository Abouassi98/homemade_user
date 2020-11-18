import 'package:flutter/material.dart';
import 'package:homemade_user/screens/driver_search_screen.dart';
import '../../widgets/customBtn.dart';
import '../../widgets/mapCard.dart';
import '../../widgets/register_text_field.dart';

class FinishOrder extends StatefulWidget {
  @override
  _FinishOrderState createState() => _FinishOrderState();
}

class _FinishOrderState extends State<FinishOrder> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  bool location = false;
  bool chosesMyLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          " تاكيد الطلب",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("3 ساعات"), Text("مدة التحضير")],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateTime.now().toString().substring(0, 10)),
                    Text("موعد الاستلام")
                  ],
                ),
              ),
            ),
          ),

          // Visibility(
          //   visible: !chosesMyLocation,
          //   child: MapCard(
          //     scaffoldKey: _scaffoldKey,
          //     onTap: () {
          //       setState(() {
          //         location = true;
          //       });
          //       Navigator.pop(context);
          //     },
          //     withAppBar: true,
          //     onChange: (v) {},
          //     onTextChange: (v) {},
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          RegisterTextField(
            label: 'كود الخصم',
            type: TextInputType.text,
            icon: Icons.money_off,
            onChange: (v) {},
            hint: 'قم باضافة كود الخصم ...',
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8),
            child: Container(
              height: 35,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("50 ريال"), Text("الاجمالي")],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 5.0, left: 5),
            child: Card(
              elevation: 5,
              child: Container(
                height: 35,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("50 ريال"), Text("السعر بعد الضريبة")],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 5.0, left: 5, top: 20, bottom: 20),
            child: Card(
              elevation: 5,
              child: Container(
                height: 35,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("100 ريال"), Text("قيمة الفاتورة")],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomBtn(
              heigh: 50,
              color: Theme.of(context).primaryColor,
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => DriverSearchScreen(),
                  ),
                );
              },
              text: 'تأكيد الطلب',
              txtColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
