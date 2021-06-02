class Games{
  String player1Name;
  String player2Name;
  int roundName;
  String planed_date;
  Games({this.player1Name ,this.player2Name, this.roundName, this.planed_date});

  factory Games.fromJson(Map<String, dynamic> json) {
    return Games(
      player1Name: json['participant1Name'] as String,
      player2Name: json['participant2Name'] as String,
      roundName: json['type'] as int,
        planed_date: json['planed_date'] as String,
    );
  }
}

class gtype {
  int rtype;
  P1 p1;
  P1 p2;

  gtype({this.rtype, this.p1, this.p2});

  gtype.fromJson(Map<String, dynamic> json) {
    rtype = json['rtype'];
    p1 = json['p1'] != null ? new P1.fromJson(json['p1']) : null;
    p2 = json['p2'] != null ? new P1.fromJson(json['p2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rtype'] = this.rtype;
    if (this.p1 != null) {
      data['p1'] = this.p1.toJson();
    }
    if (this.p2 != null) {
      data['p2'] = this.p2.toJson();
    }
    return data;
  }
}

class P1 {
  int pid;
  int type;

  P1({this.pid, this.type});

  P1.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['type'] = this.type;
    return data;
  }
}