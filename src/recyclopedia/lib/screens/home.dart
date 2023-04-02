import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/global_configuration.dart';
import 'package:recyclopedia/main.dart';
import 'package:recyclopedia/screens/item_modal.dart';
import 'package:recyclopedia/widgets/all.dart';
import 'package:collection/collection.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    final groupedData = groupBy(categoryList, (item) => item['name']);

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
          SizedBox(height: 10),
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
                      Map item = categoryList[index];
                      return ClickableTrashItem(item);
                    },
                    itemCount: categoryList.length,
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
