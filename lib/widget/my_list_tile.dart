import 'package:flutter/material.dart';
import 'package:flutter_lab_03/model/conference.dart';

class MyListTile extends StatelessWidget {
  final Conference conference;
  MyListTile(this.conference);

  @override
  Widget build(BuildContext context) {
    return _buildItem(conference);
  }

  Widget _buildItem(conference) {
    return ListTile(
      title: Text(conference.name),
      subtitle: Text(conference.location),
    );
  }
}

