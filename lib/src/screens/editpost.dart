import 'dart:io'; // File을 사용하기 위해 import
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // 권한 처리를 위한 패키지
import 'package:get/get.dart'; // Get 패키지

import '../../src/controllers/post_controller.dart';

class EditPost extends StatefulWidget {
  final String category;
  final int userId;

  EditPost({required this.category, required this.userId});

  @override
  _PostEditState createState() => _PostEditState();
}

class _PostEditState extends State<EditPost> {
  String? _selectedCategory;
  String _childName = '';
  String _childAge = '';
  String _title = '';
  String _content = '';

  // 선택된 이미지 파일 리스트
  final List<File> _images = [];

  // 이미지 피커 인스턴스
  final ImagePicker _picker = ImagePicker();

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

  // 이미지 선택 기능
  Future<void> _pickImages() async {
    // 사진 권한 요청
    final status = await Permission.photos.request();
    if (status.isGranted) {
      // 이미지 선택 다이얼로그 표시
      final List<XFile>? pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles != null) {
        setState(() {
          // 선택된 이미지를 _images 리스트에 추가
          _images.addAll(pickedFiles.map((file) => File(file.path)));
        });
      }
    } else {
      print('권한이 필요합니다.');
    }
  }

  // 이미지 제거 기능
  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  // 카테고리 버튼 위젯
  Widget _CategoryButton(String category) {
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

  Widget _TextFormField({
    required String hintText,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? style,
    int minLines = 1,
    int maxLines = 1,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFB0B0B0), width: 1.0),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: style,
          contentPadding: contentPadding,
          border: InputBorder.none, // 기본 보더 제거
          enabledBorder: InputBorder.none, // 포커스 안된 상태 보더 제거
          focusedBorder: InputBorder.none, // 포커스 시 보더 제거
        ),
        style: style?.copyWith(color: Colors.black),
        onChanged: onChanged,
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }

  Widget _TextFormFieldWithBottomBorder({
    required String hintText,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? style,
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
          // BottomBorder
          borderSide: BorderSide(color: Color(0xFFB0B0B0)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB0B0B0)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB0B0B0)),
        ),
      ),
      style: style?.copyWith(color: Colors.black),
      onChanged: onChanged,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
    );
  }

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.find<PostController>();

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
            onPressed: () async {
              // _selectedCategory가 null인 경우 widget.category로 설정
              _selectedCategory ??= widget.category;

              bool success = await postController.postWrite(
                _title,
                _content,
                1, // 실제 파일 업로드 후 fileId 값으로 대체 필요
                'imgId', // 실제 업로드된 이미지 URL로 대체 필요
                1,
                _selectedCategory!,
                _childName,
                int.tryParse(_childAge) ?? 0,
              );

              if (success) {
                Get.back(); // 성공 시 이전 페이지로 돌아가기
              } else {
                Get.snackbar(
                  '작성 실패',
                  '게시글 작성에 실패했습니다. 다시 시도해 주세요.',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
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
            SizedBox(height: 8),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _CategoryButton('자식 자랑'),
                    _CategoryButton('육아 꿀팁'),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
            _TextFormField(
              hintText: '자식의 이름을 입력해주세요.',
              onChanged: (value) => setState(() => _childName = value),
              style: _textStyle,
            ),
            _TextFormField(
              hintText: '자식의 나이를 입력해주세요',
              onChanged: (value) => setState(() => _childAge = value),
              keyboardType: TextInputType.number,
              style: _textStyle,
            ),
            _TextFormField(
              hintText: '제목을 입력하세요.',
              onChanged: (value) => setState(() => _title = value),
              style: _titleTextStyle,
            ),
            // 위쪽 보더 없음
            _TextFormFieldWithBottomBorder(
              hintText: '내용을 입력하세요.',
              onChanged: (value) => setState(() => _content = value),
              style: _textStyle,
              minLines: 8,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 16),
            // 이미지 추가 버튼
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
                      constraints: BoxConstraints.tightFor(
                          width: 48, height: 48), // 너비, 높이 지정
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
                  // GridView를 통해 사진 여러장 배치 가능
                  shrinkWrap: true, // 필요 이상의 공간 차지 x
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //그리드 레이아웃
                    crossAxisCount: 1, // 1열에 이미지 1장
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: _images.length, // 그리드에 표시할 이미지 총 수
                  itemBuilder: (context, index) {
                    final image = _images[index];
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            // 이미지
                            width: 100,
                            height: 100,
                            child: Image.file(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          //x 아이콘 위치 지정
                          top: 4,
                          right: 4,
                          child: GestureDetector(
                            // 탭 제스처 감지
                            onTap: () => _removeImage(index), //삭제
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
