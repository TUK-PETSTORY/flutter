import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 로고 & 슬로건 영역
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 슬로건
                  const SizedBox(height: 20),
                  const Text(
                    'Pet Story',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  // 로고
                  Image.asset('assets/images/logo.png',
                      width: 300, height: 300),
                ],
              ),
            ),
          ),
          Column(
            children: [
              // 가입, 로그인 버튼 영역
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // 회원가입
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Get.to(() => const Register());
                    //   },
                    //   child: const Text('시작하기'),
                    // ),
                    // 로그인
                    // const SizedBox(height: 16),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text('이미 계정이 있나요?'),
                    //     TextButton(
                    //       onPressed: () {
                    //         Get.to(() => const Login());
                    //       },
                    //       child: const Text('로그인'),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
