import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclopedia/widgets/news_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:recyclopedia/widgets/ResourceClass.dart';

class ResourcesPage extends StatelessWidget {
  List hold = [];

  Future<List<Resource>> getAll() async {
    var data = await http.get(Uri.parse(
        "https://strapi-development-6fb1.up.railway.app/api/resource"));
    var jsonData = json.decode(data.body);

    final resources = jsonData['data'];
    resources.map((resourceJson) => Resource.fromJson(resourceJson)).toList();
    hold.add(resources);
    return resources;
  }

  init() {
    getAll();
  }
  // late Future<List<Resource>> resources = getAll();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF2F935C),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Recycling on Campus',
                style: GoogleFonts.poppins(fontSize: 27.0)),
          ],
        ),
        toolbarHeight: 210,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  for (var item in hold)
                    NewsCard(
                      imgUrl: item.image,
                      desc: item.description,
                      title: item.title,
                      postUrl: item.link,
                    ),
                ]),
              ))
            ]),
      ),
    ));
  }
}
