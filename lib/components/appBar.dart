import 'package:flutter/material.dart';
import 'constant.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;

  @override
  final Size preferredSize;

  TopBar(
      {@required this.title,
      @required this.child,
      this.onPressed,
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(65.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 2.5),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: 'topBarBtn',
                child: Card(
                  elevation: 0,
                  shape: kBackButtonShape,
                  child: MaterialButton(
                    height: 50,
                    minWidth: 50,
                    elevation: 10,
                    shape: kBackButtonShape,
                    onPressed: onPressed,
                    child: child,
                  ),
                ),
              ),
              Hero(
                tag: 'title',
                transitionOnUserGestures: true,
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                  child: InkWell(
                    onTap: onTitleTapped,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: 50,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              // color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
