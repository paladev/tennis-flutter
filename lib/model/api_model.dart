class UserLogin {
  String username;
  String password;

  UserLogin({this.username, this.password});

  Map <String, dynamic> toDatabaseJson() => {
    "username": this.username,
    "password": this.password
  };
}

class Token{
  int uid;
  String token;
  Token({this.uid ,this.token});


  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      uid: json['uid'],
      token: json['token']
    );
  }
}

class Info{
  int uid;
  String token;
  Info({this.uid ,this.token});

  // factory Info.fromJson(Map<String, dynamic> json) {
  //   return Token(
  //       uid: json['uid'],
  //       token: json['token']
  //   );
  // }
}




// class Uid{
//   int uid;
//
//   Uid({this.uid});
//
//   factory Uid.fromJson(Map<String, dynamic> json) {
//     return Uid(
//         uid: json['uid']
//     );
//   }
// }

