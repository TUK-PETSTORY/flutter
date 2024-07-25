import 'package:flutter/material.dart';
import 'package:front/src/screens/editpost.dart';
import 'package:get/get.dart'; // GetX 패키지 import
import '../../src/controllers/post_controller.dart';

class FeedListItem extends StatefulWidget {
  final String category;
  final int userId;
  final String userName;
  final String userProfileUrl;
  final String childName; // 자식 이름
  final int childAge; // 자식 나이
  final String imageUrl;
  final String title;
  final String content;
  final String date;
  final int postId;

  FeedListItem({
    required this.category,
    required this.userId,
    required this.userName,
    required this.userProfileUrl,
    required this.childName,
    required this.childAge,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.date,
    required this.postId, // 추가된 부분
  });

  @override
  _FeedListItemState createState() => _FeedListItemState();
}

class _FeedListItemState extends State<FeedListItem> {
  bool isExpanded = false;
  bool showMoreButton = false;
  final PostController postController = Get.find<PostController>(); // 수정된 부분

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _measureText();
    });
  }

  void _measureText() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.content,
        style: TextStyle(fontSize: 16, fontFamily: 'MainFont'),
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 30);

    if (textPainter.size.height > 32) {
      setState(() {
        showMoreButton = true;
      });
    }
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xffFFEEEE),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.edit, color: Colors.blue),
                    title: Text('게시물 수정하기',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'MainFont',
                            fontSize: 18)),
                    onTap: () {
                      Navigator.pop(context);
                      // 게시물 수정 동작을 여기에 추가
                      Get.to(() => EditPost(
                            category: widget.category, // 현재 카테고리
                            childName: widget.childName,
                            childAge: widget.childAge,
                            title: widget.title, // 게시물 제목
                            content: widget.content, // 게시물 내용
                            postId: widget.postId,
                          ));
                    },
                  ),
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Colors.red),
                    title: Text('게시물 삭제하기',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'MainFont',
                            fontSize: 18)),
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            content: const Text(
                              '게시글이 삭제됩니다. \n 정말 삭제하시겠습니까?',
                              style: TextStyle(
                                fontFamily: 'MainFont',
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // 다이얼로그 닫기
                                },
                                child: const Text(
                                  '취소',
                                  style: TextStyle(
                                      fontFamily: 'MainFont',
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                style: TextButton.styleFrom(
                                  overlayColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFF4081),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  bool success = await postController
                                      .postDelete(widget.postId);
                                  if (success) {
                                    Get.snackbar('게시글 삭제', '게시글이 삭제되었습니다.',
                                        snackPosition: SnackPosition.BOTTOM);
                                    Navigator.pop(context); // 다이얼로그 닫기
                                    postController.fetchPosts('자식 자랑');
                                  }
                                },
                                child: const Text(
                                  '삭제',
                                  style: TextStyle(
                                      fontFamily: 'MainFont',
                                      fontSize: 18,
                                      color: Color(0xffFF4081)),
                                ),
                                style: TextButton.styleFrom(
                                  overlayColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xffFF4081),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 16), // 취소 버튼과의 간격
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16), // 네 방향 모두 둥글게
                ),
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.cancel, color: Colors.grey),
                    title: Text('취소',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'MainFont',
                            fontSize: 18)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(widget.userProfileUrl),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.userName,
                            style: TextStyle(
                              fontFamily: 'MainFont',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                            onPressed: _showMoreOptions,
                            icon: Icon(Icons.more_horiz,
                                size: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        '${widget.childName} ${widget.childAge}살',
                        style: TextStyle(
                          fontFamily: 'MainFont',
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          // Conditionally render the image based on the category
          if (widget.category == '자식 자랑' && widget.imageUrl.isNotEmpty)
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Image.asset('assets/images/noah.jpg', fit: BoxFit.cover),
            ),
          SizedBox(height: 4),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MainFont',
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'MainFont',
                        ),
                        maxLines: isExpanded ? null : 2,
                        overflow: isExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                      if (showMoreButton && !isExpanded)
                        Text(
                          '더보기',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: 'MainFont',
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.date,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'MainFont',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
