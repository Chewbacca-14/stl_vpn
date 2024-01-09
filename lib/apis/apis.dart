import 'dart:convert';
import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:vpn_basic_project/models/server_model.dart';

class APIs {
  static Future<List<VPNServer>> getVpnServers() async {
    final List<VPNServer> servers = [];
    final response =
        await http.get(Uri.parse('https://www.vpngate.net/api/iphone/'));
    final cvsString = response.body.split('#')[1].replaceAll('*', '');
    List<List<dynamic>> list = const CsvToListConverter().convert(cvsString);

    final header = list[0];
    Map<String, dynamic> tempJson = {};
    for (int i = 0; i < header.length; i++) {
      for (int j = 0; j < header.length; j++) {
        tempJson.addAll({header[j].toString(): list[i][j]});
      }
      servers.add(VPNServer.fromJson(tempJson));
    }
    return servers;
  }
}
