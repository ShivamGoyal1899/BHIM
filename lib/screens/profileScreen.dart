import 'package:BHIM/screens/deviceInfoScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'qrFullScreen.dart';

var mobileNumber = '9012218994';
var firstName = 'Shivam';
var lastName = 'Goyal';
var upiID = mobileNumber + '@upi';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text(
            'Profile & Settings',
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
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
                    'upi://pay?pa=$mobileNumber@upi&pn=$firstName $lastName&cu=INR&mode=02&purpose=00&orgid=189999&sign=MEQCHxuGu2MuYK7KM+73lS5q+4iUq8qxigXBJHCv+NeMyVsCIQClwuqF8p0T0kcHZqQKafyea+AF6rzuk45UFhW8+KCfAg==',
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  '$upiID',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2.0),
                Text(
                  '$firstName $lastName',
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
            title: Text("Mobile mumber"),
            subtitle: Text('+91 90122 18994'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
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
            onTap: () {},
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.sim_card)),
            title: Text("USSD Service (*99#)"),
            subtitle: Text(
                'Using *99# service, a user can access financial services by dialing *99# frim his/her mobile registered with the bank.'),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: null,
            ),
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.card_giftcard)),
            title: Text("Rewardz"),
            subtitle: Text('Coming Soon'),
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.exit_to_app)),
            title: Text("Logout"),
            subtitle: Text('Logout from BHIM'),
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
            leading: IconButton(icon: Icon(Icons.power_settings_new)),
            title: Text("Degister"),
            subtitle: Text('Clear BHIM UPI profile on this device'),
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
                  .push(new MaterialPageRoute(builder: (BuildContext context) {
                return DeviceInfoScreen();
              }));
            },
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
