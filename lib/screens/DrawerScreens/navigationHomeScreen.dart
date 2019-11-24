import 'package:BHIM/screens/homeScreen.dart';
import 'package:BHIM/screens/rewardzScreen.dart';
import 'package:BHIM/screens/settingsScreen.dart';
import 'package:BHIM/screens/transactionHistoryScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'appDrawer.dart';
import 'drawerUserController.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  _launchUrlWebsite() async {
    const url = 'https://bhimupi.org.in';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = HomeScreen();
    super.initState();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          title: Text(
            'Leave BHIM',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Are you sure you want to exit?\n"),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 16.0,
                          ),
                        ),
                        Text(
                          'Stay',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Leave',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 16.0,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
            backgroundColor: AppTheme.nearlyWhite,
            body: DrawerUserController(
              screenIndex: drawerIndex,
              drawerWidth: MediaQuery.of(context).size.width * 0.75,
              animationController: (AnimationController animationController) {
                sliderAnimationController = animationController;
              },
              onDrawerCall: (DrawerIndex drawerIndexdata) {
                changeIndex(drawerIndexdata);
              },
              screenView: screenView,
            ),
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = HomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.TransactionHistory) {
        setState(() {
          screenView = TransactionHistoryScreen();
        });
      } else if (drawerIndex == DrawerIndex.Rewardz) {
        setState(() {
          screenView = RewardzScreen();
        });
      } else if (drawerIndex == DrawerIndex.Settings) {
        setState(() {
          screenView = SettingsScreen();
        });
      } else if (drawerIndex == DrawerIndex.About) {
        setState(() {
          screenView = HomeScreen();
          drawerIndex = DrawerIndex.HOME;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              title: Text(
                'About BHIM',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                      "Bharat Interface for Money (BHIM) is a payment app that lets you make simple, easy and quick transactions using Unified Payments Interface (UPI). You can make direct bank payments to anyone on UPI using their UPI ID or scanning their QR with the BHIM app. You can also request money through the app from a UPI ID.\n\nPioneered and developed by National Payments Corporation of India (NPCI), BHIM has been conceived and launched by the Hon\'ble Prime Minister of India, Narendra Modi on 30th December 2016 to bring in Financial Inclusion to the nation and a digitally empowered society."),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Launch Website',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 16.0,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      _launchUrlWebsite();
                    },
                  )
                ],
              ),
            );
          },
        );
      } else {
        //do in your way......
      }
    }
  }
}
