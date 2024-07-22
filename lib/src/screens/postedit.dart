import 'dart:io'; // File을 사용하기 위해 import
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // 권한 처리를 위한 패키지

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
  final List<File> _images = []; // 선택된 이미지 파일 리스트

  final ImagePicker _picker = ImagePicker(); // 이미지 피커 인스턴스

  final TextStyle _textStyle = TextStyle(
    color: Color(0xFF828282),
    fontFamily: 'MainFont',
  );

  final TextStyle _titleTextStyle = TextStyle(
    color: Color(0xFF828282),
    fontFamily: 'MainFont',
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  Future<void> _pickImages() async {
    final status = await Permission.photos.request();
    if (status.isGranted) {
      final List<XFile>? pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles != null) {
        setState(() {
          _images.addAll(pickedFiles.map((file) => File(file.path)));
        });
      }
    } else {
      print('권한이 필요합니다.');
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  Widget _buildCategoryButton(String category) {
    return SizedBox(
      width: 100,
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedCategory = category;
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>((state) =>
              _selectedCategory == category ? Color(0xFFFF4081) : Colors.white),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>((state) =>
              _selectedCategory == category ? Colors.white : Color(0xFF828282)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 8.0)),
          overlayColor:
              MaterialStateProperty.resolveWith((state) => Color(0xFFFF4081)),
          side: MaterialStateProperty.resolveWith<BorderSide>((state) {
            return BorderSide(
              color: Color(0xFFB0B0B0),
              width: 1.0,
            );
          }),
        ),
        child: Text(category,
            style: TextStyle(fontSize: 16, fontFamily: 'MainFont')),
      ),
    );
  }

  Widget _buildTextFormFieldWithTopBorder({
    required String hintText,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? style,
    bool isTitle = false,
    int minLines = 1,
    int maxLines = 1,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFB0B0B0), width: 1.0), // 상단 보더 추가
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: style,
          contentPadding: contentPadding,
          border: InputBorder.none,
          enabledBorder: InputBorder.none, // 기본 보더 제거
          focusedBorder: InputBorder.none, // 포커스 시 보더 제거
        ),
        style: style,
        onChanged: onChanged,
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }

  Widget _buildTextFormFieldWithoutTopBorder({
    required String hintText,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? style,
    bool isTitle = false,
    int minLines = 1,
    int maxLines = 1,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
  }) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: style,
        contentPadding: contentPadding,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB0B0B0)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB0B0B0)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB0B0B0)),
        ),
      ),
      style: style,
      onChanged: onChanged,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
    );
  }

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
            onPressed: () {
              // 완료 버튼 클릭 시 처리
            },
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
            Divider(color: Color(0xFFB0B0B0)),
            SizedBox(height: 8), // 앱바와 버튼 사이의 여백

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryButton('자식 자랑'),
                    _buildCategoryButton('육아 꿀팁'),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),

            // 자식의 이름을 입력해달라는 필드
            _buildTextFormFieldWithTopBorder(
              hintText: '자식의 이름을 입력해주세요.',
              onChanged: (value) => setState(() => _childName = value),
              style: _textStyle,
            ),

            // 자식의 나이를 입력해달라는 필드
            _buildTextFormFieldWithTopBorder(
              hintText: '자식의 나이를 입력해주세요',
              onChanged: (value) => setState(() => _childAge = value),
              keyboardType: TextInputType.number,
              style: _textStyle,
            ),

            // 제목을 입력하세요 필드
            _buildTextFormFieldWithTopBorder(
              hintText: '제목을 입력하세요.',
              onChanged: (value) => setState(() => _title = value),
              style: _titleTextStyle,
              isTitle: true,
            ),

            // 내용을 입력하세요 필드 (위쪽 보더 없음)
            _buildTextFormFieldWithoutTopBorder(
              hintText: '내용을 입력하세요.',
              onChanged: (value) => setState(() => _content = value),
              style: _textStyle,
              minLines: 8,
              maxLines: 1000,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4081),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add_photo_alternate),
                      onPressed: _pickImages,
                      color: Colors.white,
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
            if (_images.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    final image = _images[index];
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.file(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: GestureDetector(
                            onTap: () => _removeImage(index),
                            child: const Icon(
                              Icons.cancel_rounded,
                              color: Colors.black87,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
