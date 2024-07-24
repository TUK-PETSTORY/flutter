import 'package:get/get.dart';
import 'package:front/src/providers/like_provider.dart';
import 'dart:developer';

class LikeController extends GetxController {
  final likeProvider = Get.put(LikeProvider());
  var likeCount = 0.obs;

  Future<void> saveLike(int userId, int postId, int siteId) async {
    Map body = await likeProvider.saveLike(userId, postId, siteId);
    if (body['success'] == true) {
      log("Like saved successfully");
    }
  }

  Future<void> deleteLike(int likeId) async {
    Map body = await likeProvider.deleteLike(likeId);
    if (body['success'] == true) {
      log("Like deleted successfully");
    }
  }

  Future<void> countLikesByPostId(int postId) async {
    Map body = await likeProvider.countLikesByPostId(postId);
    if (body['success'] == true) {
      likeCount.value = body['count'];
      log("Like count for postId $postId: ${likeCount.value}");
    } else {
      Get.snackbar("좋아요 에러", body['message'],
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> countLikesBySiteId(int siteId) async {
    Map body = await likeProvider.countLikesBySiteId(siteId);
    if (body['success'] == true) {
      likeCount.value = body['count'];
      log("Like count for siteId $siteId: ${likeCount.value}");
    } else {
      Get.snackbar("좋아요 에러", body['message'],
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
