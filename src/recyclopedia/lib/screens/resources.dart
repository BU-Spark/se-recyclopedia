import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclopedia/widgets/news_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesPage extends StatelessWidget {
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              // print("card selected");
              const url = 'https://www.bu.edu/sustainability/about/';
              final uri = Uri.parse(url);
              launchUrl(uri);
            },
            child: NewsCard(
              imgUrl: 'assets/images/testimage.jpg',
              desc:
                  "Learn more about BUs green initiatives and environmental impact",
              title: "BU Sustainability",
              postUrl: "google.com",
            ),
          )
        ]),
      ),
    ));
  }
}
