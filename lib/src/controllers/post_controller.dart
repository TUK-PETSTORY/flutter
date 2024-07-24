import 'package:get/get.dart';
import 'dart:developer';
import '../../src/providers/post_provider.dart';

class PostController extends GetxController {
  final postProvider = Get.put(PostProvider());
  var postList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var fetchPostsError = false.obs;

  Future<void> fetchPosts(String category) async {
    try {
      Map body = await postProvider.postGet(category);
      log("API Response: ${body.toString()}"); // 응답 로그 출력

      if (body['success'] == true) {
        // 단일 게시글 객체를 리스트로 변환
        List<Map<String, dynamic>> posts = [body['postList']];
        postList.value = posts;
        log("Post List: ${postList.toString()}");
      } else {
        Get.snackbar("게시글 조회 에러", body['message'] ?? "Unknown error",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("게시글 조회 에러", "데이터를 가져오는 데 실패했습니다.",
          snackPosition: SnackPosition.BOTTOM);
      log("Error: $e"); // 예외 로그 출력
    }
  }

  Future<bool> postWrite(
      String title,
      String content,
      int fileId,
      String imgUrl,
      int userId,
      String category,
      String petName,
      int petAge) async {
    Map body = await postProvider.postWrite(
        title, content, fileId, imgUrl, userId, category, petName, petAge);
    if (body['success'] == true) {
      String message = body['message'];
      log("message:$message");
      fetchPosts(category);
      return true;
    }
    Get.snackbar('게시글 등록 에러', body['message'],
        snackPosition: SnackPosition.BOTTOM);
    return false;
  }

  Future<Map?> postGet(String category) async {
    Map body = await postProvider.postGet(category);
    if (body['success'] == true) {
      return body;
    }
    Get.snackbar("게시글 조회 에러", body['message'],
        snackPosition: SnackPosition.BOTTOM);
    return null;
  }

  Future<Map?> postUpdate(
      int id,
      String title,
      String content,
      int fileId,
      String imgUrl,
      int userId,
      String category,
      String petName,
      int petAge) async {
    Map body = await postProvider.postUpdate(
        id, title, content, fileId, imgUrl, userId, category, petName, petAge);
    if (body['success'] == true) {
      Map post = body['post'];
      log("Post: ${post.toString()}");
      fetchPosts(category);
      return post;
    }
    Get.snackbar("게시글 수정 에러", body['message'],
        snackPosition: SnackPosition.BOTTOM);
    return null;
  }

  Future<bool> postDelete(int id) async {
    Map body = await postProvider.postDelete(id);
    if (body['success'] == true) {
      String message = body['message'];
      log("message:$message");
      return true;
    }
    Get.snackbar('게시글 삭제 에러', body['message'],
        snackPosition: SnackPosition.BOTTOM);
    return false;
  }
}
