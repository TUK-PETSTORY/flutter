import 'dart:io'; // File을 사용하기 위해 import
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // 권한 처리를 위한 패키지
import 'package:get/get.dart'; // Get 패키지
import 'package:path/path.dart'; // 파일 경로를 다루기 위해 import

import '../../src/controllers/post_controller.dart';

class EditPost extends StatefulWidget {
  final String category;
  final int userId;
  final String childName;
  final int? childAge;
  final String title;
  final String content;
  final String imageUrl;
  final int? postId;

  EditPost({
    required this.category,
    required this.userId,
    this.childName = '',
    this.childAge,
    this.title = '',
    this.content = '',
    this.imageUrl = '',
    this.postId,
  });

  @override
  _PostEditState createState() => _PostEditState();
}

class _PostEditState extends State<EditPost> {
  String _selectedCategory = '';
  String _title = '';
  String _content = '';
  String _childName = ''; // 자식 이름
  String _childAge = ''; // 자식 나이
  final List<File> _images = []; // 선택된 이미지 파일 리스트
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _childNameController = TextEditingController();
  final TextEditingController _childAgeController = TextEditingController();

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

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _content = widget.content;
    _selectedCategory = widget.category;

    // 상태 업데이트
    setState(() {
      _titleController.text = _title;
      _contentController.text = _content;
      _childNameController.text = widget.childName;
      _childAgeController.text = widget.childAge?.toString() ?? '';
    });

    // 이미지 URL이 있는 경우, 해당 이미지를 리스트에 추가
    if (widget.imageUrl.isNotEmpty) {
      _images.add(File(widget.imageUrl));
    }
  }

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
    required TextEditingController controller,
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
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: style,
          contentPadding: contentPadding,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        style: style?.copyWith(color: Colors.black),
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }

  Widget _TextFormFieldWithBottomBorder({
    required String hintText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? style,
    int minLines = 1,
    int maxLines = 1,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
  }) {
    return TextFormField(
      controller: controller,
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
      style: style?.copyWith(color: Colors.black),
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
              Map? result = await postController.postUpdate(
                widget.postId ?? 0,
                _titleController.text.trim(),
                _contentController.text.trim(),
                1, // fileId - 실제 값 필요
                'imgId', // imgUrl - 실제 값 필요
                widget.userId,
                _selectedCategory,
                _childNameController.text.trim(),
                int.tryParse(_childAgeController.text.trim()) ?? 0,
              );

              if (result != null && result['success'] == true) {
                Get.back(); // 성공 시 이전 페이지로 돌아가기
              } else {
                Get.snackbar(
                  '작성 실패',
                  '게시글 수정에 실패했습니다. 다시 시도해 주세요.',
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
              controller: _childNameController,
              style: _textStyle,
            ),
            _TextFormField(
              hintText: '자식의 나이를 입력해주세요',
              controller: _childAgeController,
              keyboardType: TextInputType.number,
              style: _textStyle,
            ),
            _TextFormField(
              hintText: '제목을 입력하세요.',
              controller: _titleController,
              style: _titleTextStyle,
            ),
            _TextFormFieldWithBottomBorder(
              hintText: '내용을 입력하세요.',
              controller: _contentController,
              style: _textStyle,
              minLines: 8,
              maxLines: 10,
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
                      constraints: BoxConstraints.tightFor(
                          width: 48, height: 48), // 너비, 높이 지정
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _images.isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 400, // 높이 조정
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1, // 정사각형 비율
                      ),
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFB0B0B0)),
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: FileImage(_images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: Icon(Icons.remove_circle,
                                    color: Colors.red),
                                onPressed: () => _removeImage(index),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
