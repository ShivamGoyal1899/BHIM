import 'package:BHIM/screens/background.dart';
import 'package:BHIM/screens/requestScreen.dart';
import 'package:BHIM/screens/sendScreen.dart';
import 'package:flutter/material.dart';

import '../global.dart';
import 'voicePayDialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        elevation: 4.0,
        icon: Icon(
          Icons.mic_none,
          size: 25,
        ),
        label: Text(
          'VoicePay',
          style: TextStyle(fontSize: 16.0),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Background(isImage: true),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Image.asset('assets/images/send.png'),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SendScreen();
                        }));
                      }),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Image.asset('assets/images/receive.png'),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return RequestScreen();
                      }));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Image.asset('assets/images/qr-code.png'),
                    ),
                    onTap: () => scan(),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ActionCard(
                    title: 'Mobile Prepaid',
                    icon: Icons.phone_iphone,
                  ),
                  ActionCard(
                    title: 'Movie Tickets',
                    icon: Icons.local_movies,
                  ),
                  ActionCard(
                    title: 'Electricity',
                    icon: Icons.lightbulb_outline,
                  ),
                  ActionCard(
                    title: 'Flight Tickets',
                    icon: Icons.flight_takeoff,
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ActionCard(
                    title: 'DTH',
                    icon: Icons.live_tv,
                  ),
                  ActionCard(
                    title: 'Shopping',
                    icon: Icons.shopping_cart,
                  ),
                  ActionCard(
                    title: 'Food',
                    icon: Icons.fastfood,
                  ),
                  ActionCard(
                    title: 'Broadband',
                    icon: Icons.wifi,
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ActionCard(
                    title: 'Donation',
                    icon: Icons.local_florist,
                  ),
                  ActionCard(
                    title: 'Train Tickets',
                    icon: Icons.train,
                  ),
                  ActionCard(
                    title: 'Nearby Deals',
                    icon: Icons.location_on,
                  ),
                  ActionCard(
                    title: 'More',
                    icon: Icons.more_horiz,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ActionCard({Key key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.22,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(icon, size: 30.0),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.center,
            child: Text(title, style: TextStyle(fontSize: 13.0)),
          ),
        ],
      ),
    );
  }
}
