class Post {
  String userId;
  int id;
  String title;
  String body;
  int likeCount;

  Post({this.userId, this.id, this.title, this.body, this.likeCount});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    likeCount = json['likeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['likeCount'] = this.likeCount;
    return data;
  }
}
