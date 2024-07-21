import 'package:flutter/material.dart';

class PostEdit extends StatefulWidget {
  @override
  _PostEditState createState() => _PostEditState();
}

class _PostEditState extends State<PostEdit> {
  String? _selectedCategory;
  String _childName = '';
  String _childAge = '';
  String _title = '';
  String _content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            '글작성',
            style: TextStyle(fontSize: 16, fontFamily: 'MainFont'),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              '완료',
              style: TextStyle(fontFamily: 'MainFont', color: Colors.black),
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith((state) {
                return Color(0xffFFEEEE);
              }),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 앱바와 본문 사이에 선 추가
            Container(
              color: Color(0xFFB0B0B0), // 선의 색상
              height: 1.0, // 선의 두께
            ),
            SizedBox(height: 16), // 앱바와 버튼 사이의 여백

            // 자식 자랑 또는 육아 꿀팁 버튼 선택
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100, // 버튼의 고정 너비
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedCategory = '자식 자랑';
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (state) {
                            if (state.contains(MaterialState.pressed)) {
                              return Color(0xFFFF4081); // 눌림 상태의 배경 색상
                            }
                            return _selectedCategory == '자식 자랑'
                                ? Color(0xFFFF4081)
                                : Colors.white;
                          }),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (state) {
                            if (state.contains(MaterialState.hovered)) {
                              return Colors.white; // 호버 상태의 글자 색상
                            }
                            return _selectedCategory == '자식 자랑'
                                ? Colors.white
                                : Color(0xFF828282);
                          }),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(vertical: 8.0)),
                          overlayColor:
                              MaterialStateProperty.resolveWith((state) {
                            return Color(0xFFFF4081);
                          }),
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                              (state) {
                            return BorderSide(
                              color: Color(0xFFB0B0B0), // 테두리 색상 연하게 조정
                              width: 1.0, // 테두리 두께
                            );
                          }),
                        ),
                        child: Text(
                          '자식 자랑',
                          style:
                              TextStyle(fontSize: 16, fontFamily: 'MainFont'),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    SizedBox(
                      width: 100, // 버튼의 고정 너비
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedCategory = '육아 꿀팁';
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (state) {
                            if (state.contains(MaterialState.pressed)) {
                              return Color(0xFFFF4081); // 눌림 상태의 배경 색상
                            }
                            return _selectedCategory == '육아 꿀팁'
                                ? Color(0xFFFF4081)
                                : Colors.white;
                          }),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (state) {
                            if (state.contains(MaterialState.hovered)) {
                              return Colors.white; // 호버 상태의 글자 색상
                            }
                            return _selectedCategory == '육아 꿀팁'
                                ? Colors.white
                                : Color(0xFF828282);
                          }),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(vertical: 8.0)),
                          overlayColor:
                              MaterialStateProperty.resolveWith((state) {
                            return Color(0xFFFF4081);
                          }),
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                              (state) {
                            return BorderSide(
                              color: Color(0xFFB0B0B0), // 테두리 색상 연하게 조정
                              width: 1.0, // 테두리 두께
                            );
                          }),
                        ),
                        child: Text(
                          '육아 꿀팁',
                          style:
                              TextStyle(fontSize: 16, fontFamily: 'MainFont'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // 버튼들 아래에 선 추가
                Container(
                  color: Color(0xFFB0B0B0), // 선의 색상
                  height: 1.0, // 선의 두께
                ), // 버튼 아래와 입력 필드 사이의 여백
              ],
            ),

            // 자식의 이름 입력
            TextFormField(
              decoration: InputDecoration(
                hintText: '자식의 이름을 입력해주세요.',
                hintStyle:
                    TextStyle(color: Color(0xFF828282), fontFamily: 'MainFont'),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)), // 색상 연하게 조정
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)), // 색상 연하게 조정
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)), // 색상 연하게 조정
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _childName = value;
                });
              },
            ),
            SizedBox(height: 16),
            // 자식의 나이 입력
            TextFormField(
              decoration: InputDecoration(
                hintText: '자식의 나이를 입력해주세요',
                hintStyle:
                    TextStyle(color: Color(0xFF828282), fontFamily: 'MainFont'),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)), // 색상 연하게 조정
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)), // 색상 연하게 조정
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)), // 색상 연하게 조정
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _childAge = value;
                });
              },
            ),
            SizedBox(height: 16),
            // 제목 입력
            TextFormField(
              decoration: InputDecoration(
                hintText: '제목을 입력하세요.',
                hintStyle: TextStyle(
                  color: Color(0xFF828282),
                  fontFamily: 'MainFont',
                  fontWeight: FontWeight.bold,
                  fontSize: 20, // 텍스트 크기 조정
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                border: InputBorder.none, // 아래쪽 선 제거
              ),
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            SizedBox(height: 16),
            // 내용 입력
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    minLines: 8, // 최소 줄 수 설정
                    maxLines: null, // 줄 수에 제한 없음
                    decoration: InputDecoration(
                      hintText: '내용을 입력하세요.',
                      hintStyle: TextStyle(
                        color: Color(0xFF828282),
                        fontFamily: 'MainFont',
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFB0B0B0)), // 색상 연하게 조정
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFB0B0B0)), // 색상 연하게 조정
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFB0B0B0)), // 색상 연하게 조정
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _content = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
