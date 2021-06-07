class SetResult {
  List<List> score;
  bool isFirstWin;
  SetResult({this.score,this.isFirstWin});
}

class AllSetsResult {
  List scores;
  bool isVisible;
  AllSetsResult({this.scores,this.isVisible});
}
// static List<String> getSuggestions(List<FilterPlayers> players,String query) {
//   if (query.length >= 3){
//     List<String> matches = <String>[];
//     for( var i = 0 ; i < players.length; i++ ) {
//       matches.add(players[i].name);
//     }
//     matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
//     return matches;
//   }
// }
// static FilterPlayers getSuggestionsId(List<FilterPlayers> players,String name) {
//   FilterPlayers matchingName;
//   List<String> matches = <String>[];
//   for( var i = 0 ; i < players.length; i++ ) {
//     if (players[i].name == name){
//       return players[i];
//     }
//   }
// }

