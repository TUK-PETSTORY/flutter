import 'package:flutter/material.dart';

class MyPostListItem extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final String category;

  MyPostListItem({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.category,
  });

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
                    image: NetworkImage(imageUrl),
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
                      title,
                      style: TextStyle(
                        fontFamily: 'MainFont',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    // 내용
                    Text(
                      content,
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
                      onPressed: () {
                        // 더보기 아이콘 클릭 시 동작
                      },
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
                          category,
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
            child: Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
