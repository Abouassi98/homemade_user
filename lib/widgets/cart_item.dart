import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String name;
  final int quantity;
  final int price;
  final String notice;
  final List<Widget> chips;
  final Function onEdit;
  final Function onDelete;
  CartItem({
    @required this.name,
    @required this.quantity,
    @required this.price,
    @required this.notice,
    @required this.chips,
    @required this.onEdit,
    @required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      '$price',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(56, 104, 118, 1)),
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                "الكمية     $quantity",
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
                        padding: const EdgeInsets.only(left: 10),
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
                notice,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: onDelete,
                    child: Container(
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Color(0xffD66D50),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "حذف",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.01,
                  ),
                  InkWell(
                    onTap: onEdit,
                    child: Container(
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "تعديل",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
