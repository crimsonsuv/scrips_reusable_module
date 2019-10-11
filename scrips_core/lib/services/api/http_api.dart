import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scrips_core/datamodels/login/login.dart';
import 'package:scrips_core/datamodels/post/comment.dart';
import 'package:scrips_core/datamodels/post/post.dart';
import 'package:scrips_core/datamodels/user/user.dart';

import 'api.dart';

/// The service responsible for networking requests
class HttpApi implements Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

  @override
  Future<User> getUser(int userId) async {
    // Get user profile for id
    var response = await client.get('$endpoint/users/$userId');

    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

  @override
  Future<User> getUser2(int userId) async {
    // Get user profile for id
    var response = await client.get('$endpoint/users/$userId');

    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

  @override
  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    // Get user posts for id
    var response = await client.get('$endpoint/posts?userId=$userId');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  @override
  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    // Get comments for post
    var response = await client.get('$endpoint/comments?postId=$postId');

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }

  @override
  Future<LoginResponse> login({String username, String password}) {
    // TODO: implement login
    return null;
  }

  @override
  Future<bool> likePost(int postId) async {
    var response = await client.post('$endpoint/likePost/$postId');

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
