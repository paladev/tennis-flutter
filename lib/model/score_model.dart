class ScoreRoundFull {
  int id;
  int participant1;
  int participant2;
  int type;
  int winner;
  String startDate;
  String endDate;
  String planedDate;
  String planedEndDate;
  String stage;
  int finished;
  int deleted;
  int roundId;
  int roundRound;
  Rule rule;
  Round round;
  Tournament tournament;
  String brief1;
  String brief2;

  ScoreRoundFull(
      {this.id,
        this.participant1,
        this.participant2,
        this.type,
        this.winner,
        this.startDate,
        this.endDate,
        this.planedDate,
        this.planedEndDate,
        this.stage,
        this.finished,
        this.deleted,
        this.roundId,
        this.roundRound,
        this.rule,
        this.round,
        this.tournament,
        this.brief1,
        this.brief2});

  ScoreRoundFull.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    participant1 = json['participant1'];
    participant2 = json['participant2'];
    type = json['type'];
    winner = json['winner'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    planedDate = json['planed_date'];
    planedEndDate = json['planed_end_date'];
    stage = json['stage'];
    finished = json['finished'];
    deleted = json['deleted'];
    roundId = json['round_id'];
    roundRound = json['round_round'];
    rule = json['rule'] != null ? new Rule.fromJson(json['rule']) : null;
    round = json['round'] != null ? new Round.fromJson(json['round']) : null;
    tournament = json['tournament'] != null
        ? new Tournament.fromJson(json['tournament'])
        : null;
    brief1 = json['brief1'];
    brief2 = json['brief2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['participant1'] = this.participant1;
    data['participant2'] = this.participant2;
    data['type'] = this.type;
    data['winner'] = this.winner;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['planed_date'] = this.planedDate;
    data['planed_end_date'] = this.planedEndDate;
    data['stage'] = this.stage;
    data['finished'] = this.finished;
    data['deleted'] = this.deleted;
    data['round_id'] = this.roundId;
    data['round_round'] = this.roundRound;
    if (this.rule != null) {
      data['rule'] = this.rule.toJson();
    }
    if (this.round != null) {
      data['round'] = this.round.toJson();
    }
    if (this.tournament != null) {
      data['tournament'] = this.tournament.toJson();
    }
    data['brief1'] = this.brief1;
    data['brief2'] = this.brief2;
    return data;
  }
}

class Rule {
  int id;
  String name;
  String brief;
  String full;
  int deleted;
  int clubId;
  int setsToWin;
  int gamesInSets;
  int setTieBreakPoints;
  int matchTieBreak;
  int matchTieBreakPoints;
  int noAd;
  int def;

  Rule(
      {this.id,
        this.name,
        this.brief,
        this.full,
        this.deleted,
        this.clubId,
        this.setsToWin,
        this.gamesInSets,
        this.setTieBreakPoints,
        this.matchTieBreak,
        this.matchTieBreakPoints,
        this.noAd,
        this.def});

  Rule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brief = json['brief'];
    full = json['full'];
    deleted = json['deleted'];
    clubId = json['club_id'];
    setsToWin = json['sets_to_win'];
    gamesInSets = json['games_in_sets'];
    setTieBreakPoints = json['set_tie_break_points'];
    matchTieBreak = json['match_tie_break'];
    matchTieBreakPoints = json['match_tie_break_points'];
    noAd = json['no_ad'];
    def = json['def'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['brief'] = this.brief;
    data['full'] = this.full;
    data['deleted'] = this.deleted;
    data['club_id'] = this.clubId;
    data['sets_to_win'] = this.setsToWin;
    data['games_in_sets'] = this.gamesInSets;
    data['set_tie_break_points'] = this.setTieBreakPoints;
    data['match_tie_break'] = this.matchTieBreak;
    data['match_tie_break_points'] = this.matchTieBreakPoints;
    data['no_ad'] = this.noAd;
    data['def'] = this.def;
    return data;
  }
}

class Round {
  int id;
  String name;
  int tournamentId;
  int surfaceId;
  String startDate;
  String endDate;
  int ruleId;
  int roundTypeId;
  int roundStageId;
  int groupsAmount;
  int order;
  String description;
  int deleted;
  int playersNumber;

  Round(
      {this.id,
        this.name,
        this.tournamentId,
        this.surfaceId,
        this.startDate,
        this.endDate,
        this.ruleId,
        this.roundTypeId,
        this.roundStageId,
        this.groupsAmount,
        this.order,
        this.description,
        this.deleted,
        this.playersNumber});

  Round.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tournamentId = json['tournament_id'];
    surfaceId = json['surface_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    ruleId = json['rule_id'];
    roundTypeId = json['round_type_id'];
    roundStageId = json['round_stage_id'];
    groupsAmount = json['groups_amount'];
    order = json['order'];
    description = json['description'];
    deleted = json['deleted'];
    playersNumber = json['players_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tournament_id'] = this.tournamentId;
    data['surface_id'] = this.surfaceId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['rule_id'] = this.ruleId;
    data['round_type_id'] = this.roundTypeId;
    data['round_stage_id'] = this.roundStageId;
    data['groups_amount'] = this.groupsAmount;
    data['order'] = this.order;
    data['description'] = this.description;
    data['deleted'] = this.deleted;
    data['players_number'] = this.playersNumber;
    return data;
  }
}

class Tournament {
  int id;
  String name;
  String startDate;
  String endDate;
  int clubId;
  int surfaceId;
  int ruleId;
  int courtId;
  List<int> playerTypes;

  Tournament(
      {this.id,
        this.name,
        this.startDate,
        this.endDate,
        this.clubId,
        this.surfaceId,
        this.ruleId,
        this.courtId,
        this.playerTypes});

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    clubId = json['club_id'];
    surfaceId = json['surface_id'];
    ruleId = json['rule_id'];
    courtId = json['court_id'];
    playerTypes = json['player_types'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['club_id'] = this.clubId;
    data['surface_id'] = this.surfaceId;
    data['rule_id'] = this.ruleId;
    data['court_id'] = this.courtId;
    data['player_types'] = this.playerTypes;
    return data;
  }
}