import 'package:http/http.dart' as http;

class APIs {
  static Future<void> getVpnServers() async {
    final response =
        await http.get(Uri.parse('https://www.vpngate.net/api/iphone/'));
  }
}
