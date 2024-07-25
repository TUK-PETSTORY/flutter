import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/listitems/feed_list_item.dart';
import '../../screens/postedit.dart';
import '../../controllers/post_controller.dart';

class ChildcareTips extends StatefulWidget {
  @override
  _ChildcareTipsState createState() => _ChildcareTipsState();
}

class _ChildcareTipsState extends State<ChildcareTips> {
  final PostController postController = Get.put(PostController());
  int selectedUserId = 0; // 선택된 사용자 ID를 저장할 변수

  @override
  void initState() {
    super.initState();
    // '육아 꿀팁' 카테고리로 게시글을 조회합니다.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      postController.fetchPosts('육아 꿀팁');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (postController.postList.isEmpty) {
          return Center(child: Text('게시글이 없습니다.'));
        }

        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (BuildContext context, int index) {
            var post = postController.postList[index];

            return GestureDetector(
              onTap: () {
                if (post['user'] != null) {
                  setState(() {
                    selectedUserId =
                        post['user']['id'] ?? 0; // null일 경우 기본값 0 설정
                  });
                  Get.to(() => PostEdit(
                        category: '육아 꿀팁', // 현재 카테고리
                        userId: selectedUserId, // 선택된 사용자 ID
                      ));
                }
              },
              child: FeedListItem(
                userId: post['user']?['id'] ?? 0,
                postId: post['id'] ?? 0,
                userName: post['user']?['name'] ?? '유저',
                userProfileUrl: post['user']?['imgUrl'] ?? '',
                subtitle:
                    '${post['petName'] ?? '반려동물'} ${post['petAge'] ?? '0'}살',
                imageUrl:
                    post['imgUrl'] ?? 'https://example.com/default_image.jpg',
                title: post['title'] ?? '',
                content: post['content'] ?? '',
                date: post['createAt'] ?? '',
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 새로운 게시글 작성 페이지로 이동
          Get.to(() => PostEdit(
                category: '육아 꿀팁', // 현재 카테고리
                userId: selectedUserId, // 선택된 사용자 ID 전달
              ));
        },
        child: Icon(Icons.edit),
        backgroundColor: Color(0xFFFF4081),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
