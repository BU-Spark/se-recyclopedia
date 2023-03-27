import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/global_configuration.dart';
import 'package:recyclopedia/main.dart';
import 'package:recyclopedia/widgets/all.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppHeader(),
          // BigCard(pair: pair),
          SizedBox(height: 10),

          Text("Popular Category",
                style: GoogleFonts.poppins(
                    fontSize: 27.0, fontWeight: FontWeight.bold)),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1 / 1.1,
                      ),
                      itemBuilder: (context, index) {
                        Map item = list[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0XFF4B905F),
                                    offset: Offset(4, 4),
                                    blurRadius: 0.0, 
                                    spreadRadius: 0.0, 
                                  )
                                ],
                                border: Border.all(
                                    color: const Color(0XFF4B905F), width: 3)),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Image.asset(
                                  item["image"],
                                  fit: BoxFit.contain,
                                )),
                                Text(
                                  item["name"],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: list.length,
                    ),
                  ),
                ],
              ),
            )
            
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     ElevatedButton.icon(
          //       onPressed: () {
          //         appState.toggleFavorite();
          //       },
          //       icon: Icon(icon),
          //       label: Text('Like'),
          //     ),
          //     SizedBox(width: 10),
          //     ElevatedButton(
          //       onPressed: () {
          //         appState.getNext();
          //       },
          //       child: Text('Next'),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
