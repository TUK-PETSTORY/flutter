import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import 'show.dart';

class MyPageIndex extends StatefulWidget {
  const MyPageIndex({super.key});

  @override
  _MyPageIndexState createState() => _MyPageIndexState();
}

class _MyPageIndexState extends State<MyPageIndex> {
  final AuthController authController = Get.put(AuthController());

  Rx<Map?> user = Rx<Map?>(null);

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() async {
    final userData = await authController.userShow();
    setState(() {
      user.value = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double circleRadius = screenWidth * 0.1;
    double bottomHeight = circleRadius * 2 + 60;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Pet Story', style: TextStyle(fontFamily: 'MainFont')),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(bottomHeight),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  if (user.value == null) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: circleRadius,
                          backgroundImage: NetworkImage(
                            user.value!['profile_image'] ?? 
                            'https://postfiles.pstatic.net/MjAyMjA2MjRfMjMx/MDAxNjU2MDMyMDQyMDQx.1ObmwoCe0in6YyV-I9VNP_i64QywoKxrBYlOFjt4Fd0g.-hgPSASB3oMtHfL9_46yYTCCtuRtNokwpPfIgxmQnMcg.JPEG.jobobo12/IMG_3973.JPG?type=w773',
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          user.value!['name'] ?? 'Unknown',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'MainFont',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }
                }),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    '내가 쓴 글',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MainFont',
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 1.0,
                  color: Colors.grey.shade300,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
      body: MyPageShow(),
    );
  }
}
