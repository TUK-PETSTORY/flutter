import 'package:flutter/material.dart';
import 'package:front/widgets/listitems/petconnection_list_item.dart';

class Petconnection extends StatefulWidget {
  @override
  _PetConnectionState createState() => _PetConnectionState();
}

class _PetConnectionState extends State<Petconnection> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return PetconnectionList(
          petShelter: '도그마루 보호소',
          userProfileUrl:
              'https://mblogthumb-phinf.pstatic.net/MjAyMjAxMjVfMTcw/MDAxNjQzMTAyOTg1NjY2.CnGtAfHsMeqzKuAXan3hk102JU0Cw6wM77Hr61YY81gg.BQQMgu9l_SEmNrUAkVF3SQ-VfRnbWZB3LX7cWXwFdmMg.JPEG.minziminzi128/IMG_7363.JPG?type=w800',
          imageUrl:
              'https://mblogthumb-phinf.pstatic.net/MjAyMjAxMjVfMTkg/MDAxNjQzMTAyOTg2MjQy.JsWNnKAHtSQ2I1qLLAxVZvMJtqeJHmN2JhvoX-kSnNkg._3huLhCQ4s73G6_tAvkwYdHvH25YkIiuE2hA0Pi8Dvkg.JPEG.minziminzi128/IMG_7366.JPG?type=w800',
          title: '5개월 길냥이',
          content: '애교가 많은 성격입니다.\n예쁘게 키워주실 분 연락바랍니다.\n\n010-1234-5678로 연락주세요.',
          date: '2024년 7월 20일',
        );
      },
    );
  }
}
