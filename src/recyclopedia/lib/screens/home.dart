import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/global_configuration.dart';
import 'package:recyclopedia/main.dart';
import 'package:recyclopedia/screens/all_categories.dart';
import 'package:recyclopedia/screens/item_modal.dart';
import 'package:recyclopedia/widgets/all.dart';
import 'package:collection/collection.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categoryListState = context.watch<CategoryListState>();
    var categories = categoryListState.categories;
    final groupedData = groupBy(categoryList, (item) => item['name']);

    // IconData icon;
    // if (appState.favorites.contains(pair)) {
    //   icon = Icons.favorite;
    // } else {
    //   icon = Icons.favorite_border;
    // }

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppHeader(),
            SizedBox(height: 10),
            Text("Popular Category",
                style: GoogleFonts.poppins(
                    fontSize: 27.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Column(
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
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      Map item = categories[index];
                      return ClickableTrashItem(item);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("See All",
                      style: GoogleFonts.poppins(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                ),
                AllCategory()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CategoryListState extends ChangeNotifier {
  List<dynamic> categories = popularCategoryList;

  void search(String keywords) {
    if (keywords.isEmpty) {
      categories = categoryList;
    } else {
      categories = categoryList
          .where((item) =>
              item["name"].toLowerCase().contains(keywords.toLowerCase()))
          .cast<Map<String, dynamic>>()
          .toList();
    }
    notifyListeners();
  }
}
