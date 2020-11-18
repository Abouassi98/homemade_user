import 'package:flutter/material.dart';

class CheckBoxListTileItem extends StatefulWidget {
  final String title;
  CheckBoxListTileItem({
    this.title,
  });
  @override
  _CheckBoxListTileItemState createState() => _CheckBoxListTileItemState();
}

class _CheckBoxListTileItemState extends State<CheckBoxListTileItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12
          ),
        ),
      ],
    );
  }
}
