class User {
  int id;
  String name;
  String username;
  String phoneNumber;
  String email;
  String accessToken;

  User(
      {this.id,
      this.name,
      this.username,
      this.phoneNumber,
      this.email,
      this.accessToken});

  User.initial()
      : id = 0,
        name = '',
        username = '',
        email = '',
        phoneNumber = '',
        accessToken = '';

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['accessToken'] = this.accessToken;
    return data;
  }
}
