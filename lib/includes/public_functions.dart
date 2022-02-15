import 'package:shared_preferences/shared_preferences.dart';

class LoginData {
  String? version;
  String? dns;
  String? updatesn;
  String? group;
  String? date;
  String? type;
  String? clienttype;
  String? ssh;
  String? ss5;
  String? uuid;
  String? username;
  Future storeLogindata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    version = prefs.getString('version');
    dns = prefs.getString('dns');
    updatesn = prefs.getString('updatesn');
    group = prefs.getString('group');
    date = prefs.getString('date');
    type = prefs.getString('type');
    clienttype = prefs.getString('clienttype');
    ssh = prefs.getString('ssh');
    ss5 = prefs.getString('ssh');
    uuid = prefs.getString('uuid');
    username = prefs.getString('username');
  }
}

Future clearUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('version');
  prefs.remove('dns');
  prefs.remove('updatesn');
  prefs.remove('group');
  prefs.remove('date');
  prefs.remove('type');
  prefs.remove('clienttype');
  prefs.remove('ssh');
  prefs.remove('ss5');
  prefs.remove('uuid');
  prefs.remove('username');
  prefs.remove('serverList');
}

// storeLogindata() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();

//   String? version = prefs.getString('version');
//   String? dns = prefs.getString('dns');
//   String? updatesn = prefs.getString('updatesn');
//   String? group = prefs.getString('group');
//   String? date = prefs.getString('date');
//   String? type = prefs.getString('type');
//   String? clienttype = prefs.getString('clienttype');
//   String? ssh = prefs.getString('ssh');
//   String? ss5 = prefs.getString('ssh');
//   String? uuid = prefs.getString('uuid');
// }
