import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/listitems/feed_list_item.dart';
import '../../screens/postedit.dart';
import '../../controllers/post_controller.dart';

class Childboast extends StatefulWidget {
  @override
  _ChildboastState createState() => _ChildboastState();
}

class _ChildboastState extends State<Childboast> {
  final PostController postController = Get.put(PostController());

  @override
  void initState() {
    super.initState();
    postController.fetchPosts('자식자랑');
  }

  @override
  Widget build(BuildContext context) {
    final int userId = 1; // 예시 유저 아이디, 실제 유저 아이디로 변경 필요

    return Scaffold(
      body: Obx(() {
        if (postController.postList.isEmpty) {
          return Center(child: Text('게시글이 없습니다.'));
        }

        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (BuildContext context, int index) {
            var post = postController.postList[index];
            return FeedListItem(
              postId: post['id'],
              userName: '유저',
              userProfileUrl: '',
              subtitle: '${post['pet_name']} ${post['pet_age']}살',
              imageUrl: post['img_url'] ?? '',
              title: post['title'] ?? '',
              content: post['content'] ?? '',
              date: post['created_at'] ?? '',
              onDelete: () {
                setState(() {
                  postController.postList.removeAt(index);
                });
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => PostEdit(
                category: '자식자랑',
                userId: userId,
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
