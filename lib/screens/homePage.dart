import 'package:BHIM/screens/rewardzScreen.dart';
import 'package:flutter/material.dart';
import 'TransactionHistoryScreen.dart';
import 'homeScreen.dart';
import 'voicePayDialog.dart';
import 'settingsScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _myPage,
        children: <Widget>[
          Center(
            child: Container(
              child: HomeScreen(),
            ),
          ),
          Center(
            child: Container(
              child: TransactionHistoryScreen(),
            ),
          ),
          Center(
            child: Container(
              child: RewardzScreen(),
            ),
          ),
          Center(
            child: Container(
              child: SettingsScreen(),
            ),
          ),
        ],
        physics:
            NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        child: Icon(
          Icons.mic_none,
          size: 25,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return VoicePay();
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        elevation: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(0);
                    });
                  },
                ),
                Container(
                  width: 45.0,
                  height: 6.0,
                  decoration: BoxDecoration(
//                    color: _myPage.page == 0 ? Colors.blue : Colors.transparent,
                  color: Colors.blue,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.history),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(1);
                    });
                  },
                ),
                Container(
                  width: 45.0,
                  height: 6.0,
                  decoration: BoxDecoration(
//                    color: _myPage.page == 1 ? Colors.blue : Colors.transparent,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 80),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.card_giftcard),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(2);
                    });
                  },
                ),
                Container(
                  width: 45.0,
                  height: 6.0,
                  decoration: BoxDecoration(
//                    color: _myPage.page == 2 ? Colors.blue : Colors.transparent,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(3);
                    });
                  },
                ),
                Container(
                  width: 45.0,
                  height: 6.0,
                  decoration: BoxDecoration(
//                    color: _myPage.page == 3 ? Colors.blue : Colors.transparent,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
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
