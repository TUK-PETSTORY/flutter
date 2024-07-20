import 'package:flutter/material.dart';

class PetconnectionList extends StatefulWidget {
  final String petShelter;
  final String userProfileUrl;
  final String imageUrl;
  final String title;
  final String content;
  final String date;

  PetconnectionList({
    required this.petShelter,
    required this.userProfileUrl,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.date,
  });

  @override
  _PetconnectionListState createState() => _PetconnectionListState();
}

class _PetconnectionListState extends State<PetconnectionList> {
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
              //보호소 프로필
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(widget.userProfileUrl),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.petShelter,
                    style: TextStyle(
                      fontFamily: 'MainFont',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5), //요소 사이 간격
          Container(
            //사진
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //제목
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MainFont',
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  //내용
                  widget.content,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'MainFont',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  //날짜
                  widget.date,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'MainFont',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
