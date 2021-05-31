class Games{
  String player1Name;
  String player2Name;
  String roundName;
  String planed_date;
  Games({this.player1Name ,this.player2Name, this.roundName, this.planed_date});

  factory Games.fromJson(Map<String, dynamic> json) {
    return Games(
      player1Name: json['player1Name'] as String,
      player2Name: json['player2Name'] as String,
      roundName: json['roundName'] as String,
        planed_date: json['planed_date'] as String,
    );
  }
}