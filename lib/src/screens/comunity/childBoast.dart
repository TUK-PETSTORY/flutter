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
              userName: '유저',
              userProfileUrl: '',
              subtitle: '${post['pet_name']} ${post['pet_age']}살',
              imageUrl: post['img_url'] ?? '',
              title: post['title'] ?? '',
              content: post['content'] ?? '',
              date: post['created_at'] ?? '',
              likes: 0, // Replace with actual likes if available
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => PostEdit());
        },
        child: Icon(Icons.edit),
        backgroundColor: Color(0xFFFF4081),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
