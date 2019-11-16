import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScratchCard extends StatefulWidget {
  @override
  _ScratchCardState createState() => _ScratchCardState();
}

class _ScratchCardState extends State<ScratchCard> {
  final scratchKey = GlobalKey<ScratcherState>();

  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      content: Scratcher(
        key: scratchKey,
        accuracy: ScratchAccuracy.low,
        brushSize: 50,
        threshold: 50,
        onThreshold: () {
          setState(() {
            _opacity = 1.0;
            scratchKey.currentState
                .reveal(duration: Duration(milliseconds: 500));
          });
        },
        color: Colors.grey,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: _opacity,
          child: Container(
            height: 250.0,
            width: 250.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 150.0,
                  child: Image.asset('assets/images/reward.jpg'),
                ),
                Text(
                  'You won',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontSize: 22.0),
                ),
                SizedBox(height: 8),
                Text(
                  '₹ 51',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontSize: 32.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
