import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../components/appBar.dart';
import '../global.dart';
import '../security/securityDashboard.dart';
import 'deviceInfoScreen.dart';
import 'languageScreen.dart';
import 'notificationsScreen.dart';
import 'paymentMethodsScreen.dart';
import 'privacyScreen.dart';
import 'qrFullScreen.dart';
import 'qrGenerateScreen.dart';
import 'securityScreen.dart';
import 'ussdServiceScreen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Settings',
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
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (BuildContext context) {
                return QRFullScreen();
              }));
            },
            child: Container(
              width: 150.0,
              height: 150.0,
              alignment: Alignment.center,
              child: QrImage(
                data:
                    'upi://pay?pa=$myMobileNumber@upi&pn=$myName&cu=INR&mode=02&purpose=00&orgid=189999&sign=MEQCHxuGu2MuYK7KM+73lS5q+4iUq8qxigXBJHCv+NeMyVsCIQClwuqF8p0T0kcHZqQKafyea+AF6rzuk45UFhW8+KCfAg==',
                embeddedImage: AssetImage('assets/images/ic_launcher.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(size: Size(14, 14)),
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  '$myID',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2.0),
                Text(
                  myName,
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            title: Text('ACCOUNT',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0)),
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.phone)),
            title: Text("Mobile number"),
            subtitle: Text('+91 90122 18994'),
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.backup)),
            title: Text("Payment Methods"),
            subtitle: Text('Paytm Payments Bank XX94'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PaymentMethodsScreen();
              }));
            },
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.language)),
            title: Text("Language"),
            subtitle: Text('English'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return LanguageScreen();
              }));
            },
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.sim_card)),
            title: Text("USSD Service"),
            subtitle: Text('*99#'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return USSDServiceScreen();
              }));
            },
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            title: Text('PRIVACY & SECURITY',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0)),
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.security)),
            title: Text("Privacy"),
            subtitle: Text('Sharing & visibility'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PrivacyScreen();
              }));
            },
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.notifications_none)),
            title: Text("Notifications"),
            subtitle: Text('Turn notifications on/off'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return NotificationsScreen();
              }));
            },
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.lock_outline)),
            title: Text("Security"),
            subtitle: Text('Secure lock'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return SecurityScreen();
              }));
            },
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.exit_to_app)),
            title: Text("Logout"),
            subtitle: Text('Logout from BHIM'),
            onTap: () {},
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.power_settings_new)),
            title: Text("Deregister"),
            subtitle: Text('Clear BHIM UPI profile on this device'),
            onTap: () {},
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            title: Text('INFORMATION',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0)),
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.help_outline)),
            title: Text("Help & Feedback"),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.assignment)),
            title: Text("Terms, privacy policy and licences"),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.info_outline)),
            title: Text("Version 1.1.0"),
          ),
          Divider(
            height: 0.0,
            color: Colors.black,
          ),
          ListTile(
            title: Text('DEV FEATURES',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0)),
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.perm_device_information)),
            title: Text("Device Info"),
            subtitle: Text('View handset information'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return DeviceInfoScreen();
              }));
            },
          ),
          ListTile(
            leading: IconButton(icon: Icon(FontAwesomeIcons.qrcode)),
            title: Text("Generate QR Code"),
            subtitle: Text('QR Code for any data'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return QRGenerateScreen();
              }));
            },
          ),
          ListTile(
            leading: IconButton(icon: Icon(FontAwesomeIcons.userSecret)),
            title: Text("Security Dashboard"),
            subtitle: Text('Send & Receive encrypted data'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return SecurityDashBoard();
              }));
            },
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
