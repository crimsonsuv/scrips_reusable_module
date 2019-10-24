class User {
  String userId;
  String fullName;
  String userName;
  String phoneNumber;
  String email;
  String accessToken;

  User({this.userId, this.fullName, this.userName, this.phoneNumber, this.email, this.accessToken});

  User.initial()
      : userId = '',
        fullName = '',
        userName = '',
        email = '',
        phoneNumber = '',
        accessToken = '';

  User.fromJson(Map<String, dynamic> json) {
    userId = json['id'];
    fullName = json['name'];
    userName = json['username'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.userId;
    data['name'] = this.fullName;
    data['username'] = this.userName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['accessToken'] = this.accessToken;
    return data;
  }
}
