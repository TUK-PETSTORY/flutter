import 'package:flutter/material.dart';

class FeedListItem extends StatefulWidget {
  final String userName;
  final String userProfileUrl;
  final String subtitle;
  final String imageUrl;
  final String title;
  final String content;
  final String date;
  final int likes;

  FeedListItem({
    required this.userName,
    required this.userProfileUrl,
    required this.subtitle,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.date,
    required this.likes,
  });

  @override
  _FeedListItemState createState() => _FeedListItemState();
}

class _FeedListItemState extends State<FeedListItem> {
  bool isExpanded = false;
  bool showMoreButton = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      //프레임 렌더링 후 실행
      _measureText();
    });
  }

  void _measureText() {
    //텍스트 높이 측정, 더보기 상태 설정
    final textPainter = TextPainter(
      //텍스트 레이아웃 계산
      text: TextSpan(
        text: widget.content,
        style: TextStyle(fontSize: 16, fontFamily: 'MainFont'),
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr, //텍스트 방향(왼쪽 -> 오른쪽)
    )..layout(maxWidth: MediaQuery.of(context).size.width - 30); //텍스트 레이아웃 계산

    if (textPainter.size.height > 32) {
      //32px 대략 2줄의 텍스트 높이
      setState(() {
        showMoreButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ), //경계선 추가
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              children: [
                CircleAvatar(
                  //유저 프로필
                  radius: 22,
                  backgroundImage: NetworkImage(widget.userProfileUrl),
                ),
                SizedBox(width: 8), //요소 사이 간격
                Expanded(
                  //사용자 이름, 아이콘 가로 정렬
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
                          Icon(Icons.more_horiz,
                              size: 20, color: Colors.grey), //더보기 아이콘
                        ],
                      ),
                      Text(
                        widget.subtitle,
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
          SizedBox(height: 5), //요소 사이 간격
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10), //사진 여백
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4), //요소 사이 간격
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // 제목
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MainFont',
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4), //요소 사이 간격
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
                        //내용
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
                SizedBox(height: 4), //요소 사이 간격
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.date,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'MainFont',
                      ),
                    ), //작성날짜
                    Row(
                      //좋아요 아이콘
                      children: [
                        Icon(Icons.thumb_up_off_alt),
                        SizedBox(width: 4), //요소 사이 간격
                        Text(
                          '${widget.likes}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
