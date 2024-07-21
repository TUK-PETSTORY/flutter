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

  final TextStyle _textStyle = TextStyle(
    color: Color(0xFF828282),
    fontFamily: 'MainFont',
  );

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
            Container(
              color: Color(0xFFB0B0B0), // 선의 색상
              height: 1.0, // 선의 두께
            ),
            SizedBox(height: 16), // 앱바와 버튼 사이의 여백

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
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
                              return Color(0xFFFF4081);
                            }
                            return _selectedCategory == '자식 자랑'
                                ? Color(0xFFFF4081)
                                : Colors.white;
                          }),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (state) {
                            if (state.contains(MaterialState.hovered)) {
                              return Colors.white;
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
                              color: Color(0xFFB0B0B0),
                              width: 1.0,
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
                      width: 100,
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
                              return Color(0xFFFF4081);
                            }
                            return _selectedCategory == '육아 꿀팁'
                                ? Color(0xFFFF4081)
                                : Colors.white;
                          }),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (state) {
                            if (state.contains(MaterialState.hovered)) {
                              return Colors.white;
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
                              color: Color(0xFFB0B0B0),
                              width: 1.0,
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
                Container(
                  color: Color(0xFFB0B0B0),
                  height: 1.0,
                ),
              ],
            ),

            TextFormField(
              decoration: InputDecoration(
                hintText: '자식의 이름을 입력해주세요.',
                hintStyle: _textStyle,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)),
                ),
              ),
              style: _textStyle, // 입력 텍스트에 동일한 폰트 적용
              onChanged: (value) {
                setState(() {
                  _childName = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: '자식의 나이를 입력해주세요',
                hintStyle: _textStyle,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)),
                ),
              ),
              keyboardType: TextInputType.number,
              style: _textStyle, // 입력 텍스트에 동일한 폰트 적용
              onChanged: (value) {
                setState(() {
                  _childAge = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: '제목을 입력하세요.',
                hintStyle: _textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                border: InputBorder.none,
              ),
              style: _textStyle, // 입력 텍스트에 동일한 폰트 적용
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            TextFormField(
              minLines: 8,
              maxLines: null,
              decoration: InputDecoration(
                hintText: '내용을 입력하세요.',
                hintStyle: _textStyle,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB0B0B0)),
                ),
              ),
              style: _textStyle, // 입력 텍스트에 동일한 폰트 적용
              onChanged: (value) {
                setState(() {
                  _content = value;
                });
              },
            ),
            SizedBox(height: 16),
            // 아이콘 버튼과 여백 설정
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4081), // 아이콘 버튼의 배경색
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add_photo_alternate),
                      onPressed: () {
                        // 이미지 추가 동작 구현
                      },
                      color: Colors.white, // 아이콘 색상
                      iconSize: 24.0,
                      padding: EdgeInsets.all(12.0),
                      constraints:
                          BoxConstraints.tightFor(width: 48, height: 48),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
