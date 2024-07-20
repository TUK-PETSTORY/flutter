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
                                fontSize: 18),
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
                            fontSize: 16),
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
                  widget.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MainFont',
                      color: Colors.black87),
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
                      if (!isExpanded)
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
                      children: [
                        Icon(Icons.thumb_up_off_alt),
                        SizedBox(width: 4), //요소사이 간격
                        Text(
                          '${widget.likes}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
