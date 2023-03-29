import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclopedia/global_configuration.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(child: appLogo),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('recyclopedia', style: GoogleFonts.poppins(fontSize: 27.0)),
              Text('your campus recycling tool',
                  style: GoogleFonts.poppins(fontSize: 15.0)),
            ])
          ]),
          // SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...'),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Color(0XFF2F935C),
      toolbarHeight: 210,
    );
  }
}
