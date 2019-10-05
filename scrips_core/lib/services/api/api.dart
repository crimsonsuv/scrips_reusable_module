import 'package:scrips_core/datamodels/login/login.dart';
import 'package:scrips_core/datamodels/post/comment.dart';
import 'package:scrips_core/datamodels/post/post.dart';
import 'package:scrips_core/datamodels/user/user.dart';

abstract class Api {
  Future<LoginResponse> login({String username, String password});

  Future<User> getUser(int userId);

  Future<List<Post>> getPostsForUser(int userId);

  Future<List<Comment>> getCommentsForPost(int postId);

  Future<bool> likePost(int postId);
}
