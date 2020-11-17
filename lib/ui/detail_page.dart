import 'package:flutter/material.dart';
import 'package:flutter_lab_03/model/conference.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_lab_03/extensions/extensions.dart';

class DetailPage extends StatelessWidget {
  final Conference conference;

  DetailPage(this.conference);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              conference.name,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              conference.location,
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                '${conference.start.dateToString("MMM dd, yyyy")} - ${conference.end.dateToString("MMM dd, yyyy")}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Text(
                'Go to official website',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                _launchURL(conference.link);
              },
            ),
          )
        ],
      ),
    );
  }

  _launchURL(link) async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
