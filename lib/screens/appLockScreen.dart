import 'package:flutter/material.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:local_auth/local_auth.dart';
import 'homePage.dart';
import 'package:flutter/services.dart';

class AppLockScreen extends StatefulWidget {
  AppLockScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppLockScreenState createState() => new _AppLockScreenState();
}

class _AppLockScreenState extends State<AppLockScreen> {
  bool isFingerprint = false;

  Future<Null> biometrics() async {
    final LocalAuthentication auth = new LocalAuthentication();
    bool authenticated = false;

    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    if (authenticated) {
      setState(() {
        isFingerprint = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var myPass = [1, 2, 3, 4];
    return LockScreen(
        title: "BHIM UPI",
        passLength: myPass.length,
        bgImage: "assets/images/logo.png",
        fingerPrintImage: "assets/images/ic_touch.png",
        showFingerPass: true,
        fingerFunction: biometrics,
        fingerVerify: isFingerprint,
        borderColor: Colors.white,
        showWrongPassDialog: false,
        wrongPassContent: "Wrong pass please try again.",
        wrongPassTitle: "Opps!",
        wrongPassCancelButtonText: "Cancel",
        passCodeVerify: (passcode) async {
          for (int i = 0; i < myPass.length; i++) {
            if (passcode[i] != myPass[i]) {
              return false;
            }
          }

          return true;
        },
        onSuccess: () {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (BuildContext context) {
            return MyHomePage();
          }));
        });
  }
}
