import 'package:flutter/material.dart';
import 'package:front/src/screens/home.dart';
import 'package:get/get.dart';
import '../screens/signup.dart';
import '../controllers/auth_controller.dart';

class Intro extends StatelessWidget {
  Intro({super.key});

  final AuthController authController = Get.put(AuthController());
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFEEEE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _LogoAndSlogan(),
            const SizedBox(height: 20),
            _InputFields(idController, passwordController),
            const SizedBox(height: 20),
            _ActionButtons(idController, passwordController),
          ],
        ),
      ),
    );
  }

  Widget _LogoAndSlogan() {
    return Column(
      children: [
        const Text(
          'Pet Story',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'MainFont',
          ),
        ),
        const SizedBox(height: 20),
        Image.asset(
          'assets/images/logo.png',
          width: 300,
          height: 300,
        ),
      ],
    );
  }

  Widget _InputFields(TextEditingController idController,
      TextEditingController passwordController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _TextField(label: '아이디', controller: idController),
          const SizedBox(height: 16),
          _TextField(
              label: '비밀번호', controller: passwordController, obscureText: true),
        ],
      ),
    );
  }

  Widget _TextField(
      {required String label,
      required TextEditingController controller,
      bool obscureText = false}) {
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

  Widget _ActionButtons(TextEditingController idController,
      TextEditingController passwordController) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                bool success = await authController.userLogin(
                    idController.text, passwordController.text);
                if (success) {
                  Get.to(() => Home());
                  print('로그인 성공');
                } else {
                  print('로그인 실패');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF4081),
                padding: const EdgeInsets.symmetric(vertical: 16),
                overlayColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xffFFEEEE),
                ),
              ),
              child: const Text(
                '로그인',
                style: TextStyle(
                  fontFamily: 'MainFont',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '회원이 아니신가요?',
                style: TextStyle(
                  fontFamily: 'MainFont',
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const Signup());
                },
                style: TextButton.styleFrom(
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xffFF4081),
                  ),
                ),
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    fontFamily: 'MainFont',
                    fontSize: 18,
                    color: Color(0xffFF4081),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
