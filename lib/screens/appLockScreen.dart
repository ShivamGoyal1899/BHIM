import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pointycastle/api.dart' as crypto;
import '../security/dependencyProvider.dart';
import 'homePage.dart';

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

  /// The Future that will show the Pem String
  Future<String> futureText;

  /// Future to hold the reference to the KeyPair generated with PointyCastle
  /// in order to extract the [crypto.PrivateKey] and [crypto.PublicKey]
  Future<crypto.AsymmetricKeyPair<crypto.PublicKey, crypto.PrivateKey>>
      futureKeyPair;

  /// The current [crypto.AsymmetricKeyPair]
  crypto.AsymmetricKeyPair keyPair;

  /// With the helper [RsaKeyHelper] this method generates a
  /// new [crypto.AsymmetricKeyPair<crypto.PublicKey, crypto.PrivateKey>
  Future<crypto.AsymmetricKeyPair<crypto.PublicKey, crypto.PrivateKey>>
      getKeyPair() {
    var keyHelper = DependencyProvider.of(context).getRsaKeyHelper();
    return keyHelper.computeRSAKeyPair(keyHelper.getSecureRandom());
  }

  /// GlobalKey to be used when showing the [Snackbar] for the successful
  /// copy of the Key
  final key = new GlobalKey<ScaffoldState>();

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
//          getKeyPair();
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (BuildContext context) {
            return MyHomePage();
          }));
        });
  }
}
