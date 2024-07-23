import 'package:flutter/material.dart';
import 'intro.dart'; // Intro 페이지를 import해야 합니다.

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFEEEE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Slogan(),
            const SizedBox(height: 40),
            _InputFields(),
            const SizedBox(height: 40),
            _Buttons(context),
          ],
        ),
      ),
    );
  }

  Widget _Slogan() {
    return Column(
      children: [
        const Text(
          '반려동물들을 위한 커뮤니티 어플',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'MainFont',
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _InputFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _TextField('아이디'),
          const SizedBox(height: 35),
          _TextField('비밀번호', obscureText: true),
          const SizedBox(height: 35),
          _TextField('비밀번호 확인', obscureText: true),
          const SizedBox(height: 35),
          _TextField('닉네임'),
        ],
      ),
    );
  }

  Widget _TextField(String label, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(
        fontFamily: 'MainFont',
        fontSize: 18,
      ),
      decoration: InputDecoration(
        labelText: label,
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
            color: const Color(0xffFF4081),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: const Color(0xffFF4081),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }

  Widget _Buttons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Button('취소', Colors.white, const Color(0xffFF4081), context,
              const Color(0xffFF4081)),
          _Button('확인', const Color(0xffFF4081), Colors.white, context,
              const Color(0xffFFEEEE)),
        ],
      ),
    );
  }

  Widget _Button(
    String text,
    Color backgroundColor,
    Color textColor,
    BuildContext context,
    Color overlayColor,
  ) {
    return SizedBox(
      width: 130,
      child: OutlinedButton(
        onPressed: () {
          if (text == '취소') {
            Navigator.pop(context);
          }
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: const Color(0xffFF4081), width: 2),
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          overlayColor: MaterialStateColor.resolveWith(
            (states) => overlayColor,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'MainFont',
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
