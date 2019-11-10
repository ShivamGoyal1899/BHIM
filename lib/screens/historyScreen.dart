import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text(
            'Transation History',
            style: TextStyle(
                fontSize: 22.0, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, index) => Column(
          children: <Widget>[
            ListTile(
              leading: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {})
                ],
              ),
              title: Text('UBER INDIA SYSTEMS'),
              subtitle: Text('uber@axisbank'),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '04 jun 2019 21:04',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    '₹ 899.26',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
