import 'package:scrips_core/datamodels/login/login.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/post/comment.dart';
import 'package:scrips_core/datamodels/post/post.dart';
import 'package:scrips_core/datamodels/user/user.dart';
import 'package:scrips_core/mock_data/mock_data_menu_items.dart';

import 'api.dart';

class FakeApi implements Api {
  @override
  Future<List<Comment>> getCommentsForPost(int postId) async {
    await Future.delayed(Duration(seconds: 1));

    return List<Comment>.generate(
      10,
      (index) => Comment(
          postId: postId,
          id: index,
          name: 'Comment $postId - $index',
          email: '$postId@a.com',
          body: 'Comment body $postId - $index'),
    );
  }

  @override
  Future<List<Post>> getPostsForUser(String userId) async {
    await Future.delayed(Duration(seconds: 1));

    return List<Post>.generate(
        10,
        (index) => Post(
            userId: userId,
            id: index,
            title: 'Post No $userId - $index',
            body: 'Post Body $userId - $index',
            likeCount: index * 5));
  }

  @override
  Future<User> getUser(String userId) async {
    await Future.delayed(Duration(seconds: 1));
    return User(id: userId, name: 'user $userId', phoneNumber: '$userId$userId$userId$userId$userId$userId$userId');
  }

  @override
  Future<LoginResponse> login({String username, String password}) async {
    await Future.delayed(Duration(seconds: 1));

    String userId = username;
    return LoginResponse(userId: userId);
  }

  @override
  Future<bool> likePost(int postId) async {
    await Future.delayed(Duration(seconds: 1));

    //scrips: sumeet: ToDo: FakeAPi for likePost
    return null;
  }

  @override
  Future<MainMenu> getMenuItems(String userId) async {
    await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> json = mockDataMenuItems;
    MainMenu mainMenu = MainMenu.fromJson(json);
    return mainMenu;
  }
}
