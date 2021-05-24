class User {
  int id;
  String username;
  int uid;
  String token;

  User(
      {this.id,
      this.username,
        this.uid,
      this.token});

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
      id: data['id'],
      username: data['username'],
      uid: data['uid'],
      token: data['token'],
  );

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "username": this.username,
        "uid": this.uid,
        "token": this.token
      };
}
