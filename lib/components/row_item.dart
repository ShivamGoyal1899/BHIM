import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final text;
  final value;

  RowItem(this.text, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 48,
            child: Text(text,
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.grey[600])),
          ),
          Spacer(flex: 4),
          Expanded(
              flex: 48,
              child: Text(value,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                  )))
        ],
      ),
    );
  }
}