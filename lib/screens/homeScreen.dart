import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(top: 40.0),
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    stops: [0.1, 0.3, 0.7, 0.9],
                    colors: [
                      Colors.green[900],
                      Colors.green[700],
                      Colors.orange[500],
                      Colors.orange[300],
                    ],
                  ),
                  borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.blue[900],
                      Colors.blue[700],
                      Colors.blue[500],
                      Colors.blue[300],
                    ],
                  ),
                  borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 200),
        ],
      ),
    );
  }
}
