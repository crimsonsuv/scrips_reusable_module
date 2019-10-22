import 'package:scrips_core/datamodels/login/login.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/post/comment.dart';
import 'package:scrips_core/datamodels/post/post.dart';
import 'package:scrips_core/datamodels/user/user.dart';

abstract class Api {
  Future<LoginResponse> login({String username, String password});
  Future<User> getUser(String userId);
  Future<MainMenu> getMenuItems(String userId);

  // sumeet: note: example fns - delete later
  Future<List<Post>> getPostsForUser(String userId);
  Future<List<Comment>> getCommentsForPost(int postId);
  Future<bool> likePost(int postId);
  // sumeet: END
}
