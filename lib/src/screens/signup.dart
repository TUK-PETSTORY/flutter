import 'package:flutter/material.dart';
import '../screens/intro.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  String? _errorMessage;

  void _handleSubmit() {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      setState(() {
        _errorMessage = '비밀번호가 일치하지 않습니다.';
      });
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Intro()),
    );
  }

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
          _TextField('아이디', controller: _idController),
          const SizedBox(height: 45),
          _TextField('비밀번호',
              controller: _passwordController, obscureText: true),
          const SizedBox(height: 45),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TextField('비밀번호 확인',
                  controller: _confirmPasswordController, obscureText: true),
              // Visibility 위젯을 사용하여 오류 메시지 제어
              SizedBox(
                height: 25,
                child: Visibility(
                  visible: _errorMessage != null,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _errorMessage ?? '',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontFamily: 'MainFont',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _TextField('닉네임', controller: _nicknameController),
        ],
      ),
    );
  }

  Widget _TextField(String label,
      {bool obscureText = false, required TextEditingController controller}) {
    return TextField(
      controller: controller,
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
              const Color(0xffFFEEEE),
              onPressed: _handleSubmit),
        ],
      ),
    );
  }

  Widget _Button(
    String text,
    Color backgroundColor,
    Color textColor,
    BuildContext context,
    Color overlayColor, {
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 130,
      child: OutlinedButton(
        onPressed: onPressed ??
            () {
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
