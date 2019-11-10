import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:android_device_info/android_device_info.dart';
import '../components/row_item.dart';

class VoiceScreen extends StatefulWidget {
  @override
  _VoiceScreenState createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  var data = {};

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    var data = {};

    final memory = await AndroidDeviceInfo().getNetworkInfo();
    final display = await AndroidDeviceInfo().getNfcInfo();
    var sim = await AndroidDeviceInfo().getSimInfo();
    var location = await AndroidDeviceInfo().getLocationInfo();
    final fp = await AndroidDeviceInfo().getFingeprintInfo();
    final system = await AndroidDeviceInfo().getSystemInfo();
    final battery = await AndroidDeviceInfo().getBatteryInfo();

    data.addAll(memory);
    data.addAll(display);
    data.addAll(sim);
    data.addAll(location);
    data.addAll(fp);
    data.addAll(system);
    data.addAll(battery);

    if (mounted) {
      setState(() {
        this.data = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        child: Icon(
          Icons.close,
          size: 25,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Divider(),
                RowItem('Network Available', '${data['isNetworkAvailable']}'),
                RowItem('Network', '${data['networkType']}'),
                RowItem('iPv4 Address', '${data['iPv4Address']}'),
                RowItem('iPv6 Address', '${data['iPv6Address']}'),
                RowItem('WiFi Enabled', '${data['isWifiEnabled']}'),
                RowItem('WiFi SSID', '${data['wifiSSID']}'),
                RowItem('WiFi BSSID', '${data['wifiBSSID']}'),
                RowItem('WiFi Speed', '${data['wifiLinkSpeed']}'),
                RowItem('WiFi MAC', '${data['wifiMAC']}'),
                Divider(),
                RowItem('NFC Present', '${data['isNfcPresent']}'),
                RowItem('NFC Enabled', '${data['isNfcEnabled']}'),
                Divider(),
                RowItem('IMSI', '${data['imsi']}'),
                RowItem('Serial', '${data['serial']}'),
                RowItem('Country', '${data['country']}'),
                RowItem('Carrier', '${data['carrier']}'),
                RowItem('SIM Locked', '${data['isSimNetworkLocked']}'),
                RowItem('Multi SIM', '${data['isMultiSim']}'),
                RowItem('Active SIM(s)', '${data['numberOfActiveSim']}'),
                Divider(),
                RowItem(
                    'Fingerprint Sensor', '${data['isFingerprintSensorPresent']}'),
                RowItem('Fingerprints Enrolled', '${data['areFingerprintsEnrolled']}'),
                Divider(),
                RowItem('Model', data['model']),
                RowItem('Product', data['product']),
                RowItem('Board', data['board']),
                RowItem('Manufacturer', data['manufacturer']),
                RowItem('Device', data['device']),
                RowItem('Hardware', data['hardware']),
                RowItem('Device Type', data['deviceType']),
                RowItem('Phone Type', data['phoneType']),
                RowItem('Phone Number', data['phoneNo']),
                RowItem('Orientation', data['orientation']),
                RowItem('Screen Display ID', data['screenDisplayID']),
                Divider(),
                RowItem('Android Version', data['osVersion']),
                RowItem('Codename', data['osCodename']),
                RowItem('SDK Verson', data['buildVersionSDK'].toString()),
                RowItem('Build Codename', data['buildVersionCodename']),
                Divider(),
                RowItem('Radio Version', data['radioVer']),
                RowItem('Bootloader', data['bootloader']),
                RowItem('fingerprint', data['fingerprint']),
                RowItem('Is Rooted?', data['isDeviceRooted'].toString()),
                Divider(),
                RowItem('Build Brand', data['buildBrand']),
                RowItem('Build Host', data['buildHost']),
                RowItem('Build Tags', data['buildTags']),
                RowItem('Build Version Incremental', data['buildVersionIncremental']),
                RowItem('Build User', data['buildUser']),
                RowItem('Build Version Release', data['buildVersionRelease']),
                Divider(),
                RowItem('Charge Level', '${data['batteryPercentage']}%'),
                RowItem('Health', data['batteryHealth']),
                RowItem('is Charging', '${data['isDeviceCharging']}'),
                RowItem('Source', '${data['chargingSource']}'),
                RowItem('Technology', data['batteryTechnology']),
                RowItem('Temperature', '${data['batteryTemperature']}°c'),
                RowItem('Voltage', '${data['batteryVoltage']}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
