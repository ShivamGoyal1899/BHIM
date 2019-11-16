import 'package:BHIM/components/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'scratchCardDialog.dart';

class RewardzScreen extends StatefulWidget {
  @override
  _RewardzScreenState createState() => _RewardzScreenState();
}

class _RewardzScreenState extends State<RewardzScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Rewardz',
        child: Container(
          child: CircleAvatar(
            radius: 17.0,
            backgroundImage: AssetImage('assets/images/logo.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  '₹ 3550',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2.0),
                Text(
                  'Total Rewardz',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 20.0,
              runSpacing: 20.0,
              children: <Widget>[
                ActionCard(
                  title: "You won",
                  subtitle: '₹ 51',
                  onPressed: ScratchCard(),
                ),
                ActionCard(
                  title: "You won",
                  subtitle: '₹ 51',
                  onPressed: ScratchCard(),
                ),
                ActionCard(
                  title: "You won",
                  subtitle: '₹ 51',
                  onPressed: ScratchCard(),
                ),
                ActionCard(
                  title: "You won",
                  subtitle: '₹ 51',
                  onPressed: ScratchCard(),
                ),
                ActionCard(
                  title: "You won",
                  subtitle: '₹ 51',
                  onPressed: ScratchCard(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Widget onPressed;
  final String title;
  final String subtitle;

  const ActionCard({Key key, this.onPressed, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return onPressed;
          },
        );
      },
      child: Ink(
        height: MediaQuery.of(context).size.width * 0.425,
        width: MediaQuery.of(context).size.width * 0.425,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              child: Image.asset('assets/images/reward.jpg'),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 14.0,
                  ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 22.0,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
