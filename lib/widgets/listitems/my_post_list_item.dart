import 'package:flutter/material.dart';

class MyPostListItem extends StatefulWidget {
  final String title;
  final String content;
  final String imgUrl; // imageUrl을 imgUrl로 수정
  final String category;

  MyPostListItem({
    required this.title,
    required this.content,
    required this.imgUrl, // imageUrl을 imgUrl로 수정
    required this.category,
  });

  @override
  _MyPostListItemState createState() => _MyPostListItemState();
}

class _MyPostListItemState extends State<MyPostListItem> {
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
                                onPressed: () {
                                  // 삭제 동작 추가
                                  Navigator.pop(context); // 다이얼로그 닫기
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
    // 화면의 가로 크기를 가져옴
    double screenWidth = MediaQuery.of(context).size.width;

    // 이미지의 너비와 높이를 화면 가로 크기의 비율로 설정
    double imageSize = screenWidth * 0.2; // 화면의 20%로 설정

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12), // 컨테이너 여백
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로필 이미지
              Container(
                width: imageSize,
                height: imageSize,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(widget.imgUrl), // imageUrl을 imgUrl로 수정
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 텍스트와 아이콘이 있는 Row
              Expanded(
                // 제목과 내용이 있는 Column
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    // 제목
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontFamily: 'MainFont',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    // 내용
                    Text(
                      widget.content,
                      maxLines: 1, // 최대 1줄로 설정
                      overflow: TextOverflow.ellipsis, // 넘칠 경우 말 줄임표(...) 표시
                      style: TextStyle(
                        fontFamily: 'MainFont',
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // 더보기와 카테고리가 있는 Container
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 더보기 아이콘
                    IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: _showMoreOptions,
                    ),
                    SizedBox(height: 15),
                    // 카테고리 태그
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      constraints: BoxConstraints(
                        minWidth: 60,
                        minHeight: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffFF4081),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          widget.category,
                          style: TextStyle(
                            fontFamily: 'MainFont',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // 밑줄 추가
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
            margin: EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );
  }
}
