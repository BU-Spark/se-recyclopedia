import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclopedia/widgets/news_card.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF2F935C),
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
            children: const <Widget>[
              NewsCard(
                imgUrl:
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.TFHeRKb4eBZMaGsY9XwEtAHaD3%26pid%3DApi&f=1&ipt=acfd838d5cd8ce80bb8ad8ac5f9faf90d013d27e68facfacf03b8f755bf9918f&ipo=images",
                desc: "test description",
                title: "test headline",
                content: "Test content",
              ),
            ]),
      ),
    ));
  }
}
