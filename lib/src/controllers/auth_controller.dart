import 'package:get/get.dart';
import '../../src/providers/auth_provider.dart';
import '../../src/shared/Global.dart';
import 'dart:developer';

class AuthController extends GetxController {
  final authProvider = Get.put(AuthProvider());

  Future<bool> userJoin(String accountId, String password, String name) async {
    Map body = await authProvider.userJoin(accountId, password, name);
    if (body['success'] == true) {
      String token = body['access_token'];
      log("token:$token");
      Global.accessToken = token;
      return true;
    }
    Get.snackbar('회원가입 에러', body['message'],
        snackPosition: SnackPosition.BOTTOM);
    return false;
  }

  Future<bool> userLogin(String accountId, String password) async {
    Map body = await authProvider.userLogin(accountId, password);
    if (body != null && body['success'] == true) {
      String token = body['access_token'];
      log("token:$token");
      Global.accessToken = token;
      return true;
    }
    Get.snackbar("로그인 에러", body['message'] ?? '알 수 없는 오류 발생',
        snackPosition: SnackPosition.BOTTOM);
    return false;
  }

  Future<Map?> userShow() async {
    Map body = await authProvider.userShow();
    if (body != null && body['success'] == true) {
      Map user = body['user'];
      log("User: ${user.toString()}");
      return user;
    }
    Get.snackbar("유저 정보 에러", body['message'] ?? '알 수 없는 오류 발생',
        snackPosition: SnackPosition.BOTTOM);
    return null;
  }

  Future<List<Map>?> getMyPosts() async {
    Map body = await authProvider.getMyPosts();
    if (body != null && body['success'] == true) {
      List<Map> posts = List<Map>.from(body['posts']);
      log("Posts: ${posts.toString()}");
      return posts;
    }
    Get.snackbar("게시물 정보 에러", body['message'] ?? '알 수 없는 오류 발생',
        snackPosition: SnackPosition.BOTTOM);
    return null;
  }
}
