import 'package:flutter/material.dart';
import 'package:flutter_lab_03/model/conference.dart';
import 'package:flutter_lab_03/ui/detail_page.dart';
import 'package:flutter_lab_03/widget/my_list_tile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Conference> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchList();
  }

  Future<void> _fetchList() async {
    _items = await fetchConferencelist();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // return ListView.builder(
    //   padding: const EdgeInsets.all(8),
    //   itemCount: _items.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     // if (index == 0) return HeaderTile();
    //     return InkWell(
    //       child: MyListTile(_items[index]),
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => DetailPage(_items[index])),
    //         );
    //       },
    //     );
    //   },
    // );

    return ListView(
      children: _items.map((conference) {
        return InkWell(
          child: MyListTile(conference),
          onTap: () {
            //누르면 화면 전환
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(conference)),
            );
          },
        );
      }).toList(),
    );
  }

  Future<List<Conference>> fetchConferencelist() async {
    //await와 async는 한 셋트
    //await는 Future가 종료되는 것을 기다린다. async 키워드가 붙어있는 메서드 안에서만 사용 가능
    final http.Response response = await http.get(
        'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json');

    if (response.statusCode == 200) {
      //200 정상코드

      // //jsonDecode로 응답받은 값을 String에서 Map형태로 바꿔주는 것
      final Iterable json = jsonDecode(response.body);

      return json.map((e) => Conference.fromJson(e)).toList();
    } else {
      //에러가 나면 예외 발생시키고 종료
      throw Exception('Failed to load album');
    }
  }
}
