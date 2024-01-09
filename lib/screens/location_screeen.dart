import 'package:flutter/material.dart';
import 'package:vpn_basic_project/apis/apis.dart';
import 'package:vpn_basic_project/models/server_model.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    APIs.getVpnServers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: APIs.getVpnServers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for the data
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle errors
          return Text('Error: ${snapshot.error}');
        } else {
          // Data has been successfully fetched
          List<VPNServer>? servers = snapshot.data;

          return ListView.builder(
            itemCount: servers!.length,
            itemBuilder: (context, index) {
              var item = servers[index];
              return ListTile(
                title: Text('${item.hostName}'),
                subtitle: Text('${item.ping}'),
              );
            },
          );
        }
      },
    ));
  }
}
