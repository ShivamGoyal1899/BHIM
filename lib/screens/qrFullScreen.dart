import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'profileScreen.dart';

class QRFullScreen extends StatefulWidget {
  @override
  _QRFullScreenState createState() => _QRFullScreenState();
}

class _QRFullScreenState extends State<QRFullScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: 'upi://pay?pa=$mobileNumber@upi&pn=$firstName $lastName&cu=INR&mode=02&purpose=00&orgid=189999&sign=MEQCHxuGu2MuYK7KM+73lS5q+4iUq8qxigXBJHCv+NeMyVsCIQClwuqF8p0T0kcHZqQKafyea+AF6rzuk45UFhW8+KCfAg==',
                  child: QrImage(
                    padding: EdgeInsets.all(50.0),
                    data:
                    'upi://pay?pa=$mobileNumber@upi&pn=$firstName $lastName&cu=INR&mode=02&purpose=00&orgid=189999&sign=MEQCHxuGu2MuYK7KM+73lS5q+4iUq8qxigXBJHCv+NeMyVsCIQClwuqF8p0T0kcHZqQKafyea+AF6rzuk45UFhW8+KCfAg==',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AppBar(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.black,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
