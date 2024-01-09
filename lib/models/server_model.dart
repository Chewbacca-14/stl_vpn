class VPNServer {
  String? hostName;
  String? iP;
  int? score;
  int? ping;
  int? speed;
  String? countryLong;
  String? countryShort;
  int? numVpnSessions;
  int? uptime;
  int? totalUsers;
  int? totalTraffic;
  String? logType;
  String? operator;
  String? message;
  String? openVPNConfigDataBase64;

  VPNServer(
      {this.hostName,
      this.iP,
      this.score,
      this.ping,
      this.speed,
      this.countryLong,
      this.countryShort,
      this.numVpnSessions,
      this.uptime,
      this.totalUsers,
      this.totalTraffic,
      this.logType,
      this.operator,
      this.message,
      this.openVPNConfigDataBase64});

  VPNServer.fromJson(Map<String, dynamic> json) {
    hostName = json['HostName'] ?? '';
    iP = json['IP'] ?? '';

    // Handle score, ping, and speed as numbers or set them to 0 if not available
    score = json['Score'] is int ? json['Score'] : -1;
    ping = json['Ping'] is int ? json['Ping'] : -1;
    speed = json['Speed'] is int ? json['Speed'] : -1;

    countryLong = json['CountryLong'];
    countryShort = json['CountryShort'];
    numVpnSessions =
        json['NumVpnSessions'] is int ? json['NumVpnSessions'] : -1;

    uptime = json['Uptime'] is int ? json['Uptime'] : -1;
    totalUsers = json['TotalUsers'] is int ? json['TotalUsers'] : -1;
    totalTraffic = json['TotalTraffic'] is int ? json['TotalTraffic'] : -1;
    logType = json['LogType'];
    operator = json['Operator'];
    message = json['Message'];
    openVPNConfigDataBase64 = json['OpenVPN_ConfigData_Base64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HostName'] = this.hostName;
    data['IP'] = this.iP;
    data['Score'] = this.score;
    data['Ping'] = this.ping;
    data['Speed'] = this.speed;
    data['CountryLong'] = this.countryLong;
    data['CountryShort'] = this.countryShort;
    data['NumVpnSessions'] = this.numVpnSessions;
    data['Uptime'] = this.uptime;
    data['TotalUsers'] = this.totalUsers;
    data['TotalTraffic'] = this.totalTraffic;
    data['LogType'] = this.logType;
    data['Operator'] = this.operator;
    data['Message'] = this.message;
    data['OpenVPN_ConfigData_Base64'] = this.openVPNConfigDataBase64;
    return data;
  }
}
