import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFEEEE),
      body: Center(
        // Center 위젯으로 전체 Column을 가운데 정렬
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 수직 중앙 정렬
          crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
          children: [
            // 로고 & 슬로건 영역
            Column(
              children: [
                // 슬로건
                const Text(
                  'Pet Story',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MainFont'),
                ),
                const SizedBox(height: 20), // 슬로건과 로고 사이 간격
                // 로고
                Image.asset('assets/images/logo.png', width: 300, height: 300),
              ],
            ),
            const SizedBox(height: 20), // 로고와 입력 필드 사이 간격
            // 아이디 및 비밀번호 입력 필드 영역
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // 아이디 입력 필드
                  TextField(
                    style: const TextStyle(
                      fontFamily: 'MainFont',
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      labelText: '아이디',
                      labelStyle: const TextStyle(
                        fontFamily: 'MainFont',
                        fontSize: 18,
                        color: Color(0xff828282),
                      ),
                      filled: true, // 배경색을 사용
                      fillColor: Colors.white, // 배경색 설정
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none, // 기본 테두리 제거
                      ),
                      enabledBorder: OutlineInputBorder(
                        // 포커스 x 상태
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Color(0xffFF4081),
                          width: 1, // 보더 두께
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // 포커스 상태
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Color(0xffFF4081),
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // 비밀번호 입력 필드
                  TextField(
                    obscureText: true,
                    style: const TextStyle(
                      fontFamily: 'MainFont',
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      labelStyle: const TextStyle(
                        fontFamily: 'MainFont',
                        fontSize: 18,
                        color: Color(0xff828282),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Color(0xffFF4081),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Color(0xffFF4081),
                          width: 2,
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // 가입, 로그인 버튼 영역
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF4081),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Color(0xffFFEEEE)),
                      ),
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                            fontFamily: 'MainFont',
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '회원이 아니신가요?',
                        style: TextStyle(fontFamily: 'MainFont', fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xffFF4081)),
                        ),
                        child: const Text(
                          '회원가입',
                          style: TextStyle(
                              fontFamily: 'MainFont',
                              fontSize: 18,
                              color: Color(0xffFF4081)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
