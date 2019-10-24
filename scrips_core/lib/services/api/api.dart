import 'package:flutter/material.dart';
import 'package:scrips_core/datamodels/login/login.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/post/comment.dart';
import 'package:scrips_core/datamodels/post/post.dart';
import 'package:scrips_core/datamodels/user/user.dart';

abstract class Api {
  Future<User> getUser(BuildContext context, {String userName, String password});
  Future<MainMenu> getMenuItems(String userId);

  // scrips: sumeet: note: example fns - delete later
  Future<List<Post>> getPostsForUser(String userId);
  Future<List<Comment>> getCommentsForPost(int postId);
  Future<bool> likePost(int postId);
  // scrips: sumeet: END
}
