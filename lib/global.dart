import 'package:barcode_scan/barcode_scan.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';
import 'package:simple_rsa/simple_rsa.dart';
import 'package:url_launcher/url_launcher.dart';

String publicKey =
    "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvt4Iixd3XigxqLLHvMp4PDKklFGFbuqnO96AoUdcLl8IHdv6o3gUJnCz3fpj7VFXQzBD0rZ4aOJhJrctfi9F6OGmcazpj7BVk3B1YbjEVLJf3fsZ27PlnwBd8y4te3EcLdUDlFOKErXXb6kCzd4h6azAKik9VYrIn/nnpfuVJLBTenuJEcnHJRY8MyWlL7F3epikHOvqCQRtDcmEqbrMJqLVCLXVjYlZTnPyrzemQ+tGcpVaKKwsjb1EDR9JgDP/Xkpy8eZ18vCDHncpUp2k7FoBM1pg6n1PBMCYGYMN5J76dX7bjeRVeFkRR2Ajh2Ajw2/UL1C+guDeALlUO92fywIDAQAB";
String privateKey =
    "MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQC+3giLF3deKDGosse8yng8MqSUUYVu6qc73oChR1wuXwgd2/qjeBQmcLPd+mPtUVdDMEPStnho4mEmty1+L0Xo4aZxrOmPsFWTcHVhuMRUsl/d+xnbs+WfAF3zLi17cRwt1QOUU4oStddvqQLN3iHprMAqKT1Visif+eel+5UksFN6e4kRycclFjwzJaUvsXd6mKQc6+oJBG0NyYSpuswmotUItdWNiVlOc/KvN6ZD60ZylVoorCyNvUQNH0mAM/9eSnLx5nXy8IMedylSnaTsWgEzWmDqfU8EwJgZgw3knvp1ftuN5FV4WRFHYCOHYCPDb9QvUL6C4N4AuVQ73Z/LAgMBAAECggEBAJWdHj1Ji7w27ZY7be5DF7S4TeIldN7Y+XYol9PUSCHhRE+DnBh/i+wF9DhQifwBAtIcB04o0oIE0fqzI+oBzF8cYohA7mQ/6RTF1n1fhCaQHC25Iy/g+GGGvB5fWC+nHlue2ktuoJDCEbnpVdViBltRmuBxqy5et50PG9I0P1idtFciZ9MuzcYSvdkErgAtDc4YA4XFcN6o9l3UnuW1I0c6ECzA13QIh6tCeHMFaGbVfgiW224nBvnEZWVR9TiLcvQ0GqhIMyiX1sbOEOjWmaaHquoFo78lnW7URR42ktYSERcuwzleItT09rA3qpHoYAOj/JIwRYIn9LS+VS50dWECgYEA5FnQdQ4wSP4307NRxy7eqDaS4i+2Jq+XITtUMt30WQuwg3X13VFkH1AIxcXOxXRwfQZyjQEKLJBCZOHXSlIjtAgIGp7gn7usVLlnM0aUbElVohEYzr185L54Yt2zcHDTH7f7pWhF8beMWizJ0A03rSDXYcI3XCzmLHQEkjLK1vcCgYEA1fpX4gObPfumwWv7TLUAvtNAkmW4aTYtG0+kjqPURzsXhETTmklC7aGjvzFg7YGxBTDzR+rYQIeE9khoGKRSsZhcn1gDAlLg6vfTOgETRmemYVFqOb+40BICV8j/jHxxV7vwRenQFOwnsP+bJ+poABfhqPO+HLzOd8KhNseBZM0CgYEAtYvSd734FZBHwj/m3H0e+I2q6bkVEFy5wunwXyCni8QHafz2pCZ5e4ud7d7+LW4NoNjnacNR22w13Q7Qo336dL+N8dwuqdADirh8m/+ZMR58voTpPDTafuIPxEqOxu5sa+NSZocoVKyhIXBKYuafRT2+/zHx4Y6w0NbMa4+GRLECgYEAmxV9Wo74lhztCGUF1tuc9bFQrIpS9NZSLOg1QTiWIyY97hygLMOKYYZ0kp7sPFdyAGww9t/L6kEOah2ibLG0SYk/IDH+xFFjOIlzqyeaW73FxeTnE4HUJeHXlt5T8PNEhqztAQ7sRC3AurUXM//dbqvgXr6B/HwPPJdwlq5UJsUCgYEAshqcXJ/5Y9HPIheenyNSH1MKaLD91cmRr+nO/stMy+l57VVoqeT2uhxMEbj+Xh7HeMJoXPQ1zfVOdjM2IMJ/caJ2WeIXcooiNLVjYXyb84cSPPCblNbV5tHeI5lqNXnjiL6AkMzQm+L8cbJumOZMDywIod+Sy06sIN/iEUZu7HU=";

String myHash = 'Qmei1GvwVk2C3ZMFsDmyWZDoWs4oqW1v9eRJfWkF3Nr9mj';

String myName = 'Shivam Goyal';
String myID = 'shivamgoyal@upi';
String myMobileNumber = '+919012218994';
List<String> users = [
  'Utkarsh Mishra',
  'Mankaran Singh',
  'Ambika Arora',
  'Radhika Singhania',
  'Paytm',
  'Khushboo Verma',
  'Zomato',
  'Uber',
  'Swiggy',
  'Abhishek Jain',
  'Sidhant Singh',
  'Saurabh Garg',
  'BookMyShow'
];

List<String> listDecryptedTransaction = [];

Future sendMoneyTransaction() async {
  String myTID = 'NPC' + randomNumeric(32).toString();
  print(
      '------------------------------ Previous Hash -------------------------------\n' +
          myHash);
  print(
      '----------------------------------------------------------------------------\n\n');
  print(
      '----------------------------- Transaction ID -------------------------------\n' +
          myTID);
  print(
      '----------------------------------------------------------------------------\n\n');
  int selectedUserNumber = randomBetween(0, users.length - 1);
  String text =
      '${users[selectedUserNumber]},${users[selectedUserNumber].toLowerCase().replaceAll(' ', '') + '@upi'},${'+91' + randomBetween(7000000000, 9999999999).toString()},$myName,$myID,$myMobileNumber,${randomBetween(10, 2000)},$myTID,${DateTime.now()},success';
  print(
      '--------------------------------- Text -------------------------------------\n' +
          text);
  print(
      '----------------------------------------------------------------------------\n\n');
  String encryptedText = await encryptString(text, publicKey);
  encryptedText = encryptedText.replaceAll('\n', '');
  print(
      '----------------------------- Encrypted Text -------------------------------\n' +
          encryptedText);
  print(
      '----------------------------------------------------------------------------\n');
  String url = 'https://npci-database.herokuapp.com/contact';
  var body = {
    'status': myHash == '' ? 'Y' : 'N',
    'hash': myHash == '' ? '' : myHash,
    'tid': myTID,
    'main': encryptedText,
  };
  var response = await http.post(url, body: body);
  myHash = response.body;
  print(
      '------------------------------ Updated Hash --------------------------------\n' +
          myHash);
  print(
      '----------------------------------------------------------------------------\n');
  print(
      '                                   _                                        \n');
  print(
      '                               .__(.)<  (AeroCoders)                        \n');
  print(
      '                                \\___)                                       \n');
  print(
      '                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                         \n\n');
}

Future requestMoneyTransaction() async {
  String myTID = 'NPC' + randomNumeric(32).toString();
  print(
      '------------------------------ Previous Hash -------------------------------\n' +
          myHash);
  print(
      '----------------------------------------------------------------------------\n\n');
  print(
      '----------------------------- Transaction ID -------------------------------\n' +
          myTID);
  print(
      '----------------------------------------------------------------------------\n\n');
  int selectedUserNumber = randomBetween(0, users.length - 1);
  String text =
      '$myName,$myID,$myMobileNumber,${users[selectedUserNumber]},${users[selectedUserNumber].toLowerCase().replaceAll(' ', '') + '@upi'},${'+91' + randomBetween(7000000000, 9999999999).toString()},${randomBetween(10, 2000)},$myTID,${DateTime.now()},pending';
  print(
      '--------------------------------- Text -------------------------------------\n' +
          text);
  print(
      '----------------------------------------------------------------------------\n\n');
  String encryptedText = await encryptString(text, publicKey);
  encryptedText = encryptedText.replaceAll('\n', '');
  print(
      '----------------------------- Encrypted Text -------------------------------\n' +
          encryptedText);
  print(
      '----------------------------------------------------------------------------\n');
  String url = 'https://npci-database.herokuapp.com/contact';
  var body = {
    'status': myHash == '' ? 'Y' : 'N',
    'hash': myHash == '' ? '' : myHash,
    'tid': myTID,
    'main': encryptedText,
  };
  var response = await http.post(url, body: body);
  myHash = response.body;
  print(
      '------------------------------ Updated Hash --------------------------------\n' +
          myHash);
  print(
      '----------------------------------------------------------------------------\n');
  print(
      '                                   _                                        \n');
  print(
      '                               .__(.)<  (AeroCoders)                        \n');
  print(
      '                                \\___)                                       \n');
  print(
      '                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                         \n\n');
}

Future getAllTransactions() async {
  listDecryptedTransaction.clear();
  print(
      '------------------------------ Recorded Hash -------------------------------\n' +
          myHash);
  print(
      '----------------------------------------------------------------------------\n\n');
  String url = 'https://ipfs.io/ipfs/' + myHash;
  var response = await http.get(url);
  List<String> listEncryptedTransaction = response.body.split('\n');
  String lastEncryptedTransaction =
      listEncryptedTransaction[listEncryptedTransaction.length - 2];
  print(
      '----------------------- Last Encrypted Transaction -------------------------\n' +
          lastEncryptedTransaction);
  print(
      '----------------------------------------------------------------------------\n\n');
  print(
      '------------------------ All Decrypted Transaction -------------------------\n');
  for (int i = listEncryptedTransaction.length - 2; i >= 0; i--) {
    String toBeAddedTransaction =
        await decryptString(listEncryptedTransaction[i], privateKey);
    print(toBeAddedTransaction);
    if (!listEncryptedTransaction.contains(toBeAddedTransaction)) {
      listDecryptedTransaction.add(toBeAddedTransaction);
    }
  }
//  listDecryptedTransaction = listEncryptedTransaction.reversed.toList();
  print(
      '----------------------------------------------------------------------------\n');
  print(
      '                                   _                                        \n');
  print(
      '                               .__(.)<  (AeroCoders)                        \n');
  print(
      '                                \\___)                                       \n');
  print(
      '                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                         \n\n');
}

Future scan() async {
  String barcode = await BarcodeScanner.scan();
  if (await canLaunch(barcode)) {
    await launch(barcode);
  } else {
    throw 'Could not launch $barcode';
  }
}
