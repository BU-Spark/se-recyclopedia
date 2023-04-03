import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclopedia/global_configuration.dart';
import 'package:collection/collection.dart';
import 'package:recyclopedia/widgets/all.dart';

// TODO: each section is taking too much vertical space
class AllCategory extends StatelessWidget {
  AllCategory({super.key});

  final groupedData = groupBy(categoryList, (item) => item['name'][0]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text("All Category",
                style: GoogleFonts.poppins(
                    fontSize: 27.0, fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1 / 1.2,
              ),
              itemCount: groupedData.length, // Total number of sections
              itemBuilder: (BuildContext context, int sectionIndex) {
                final sectionName = groupedData.keys.toList()[sectionIndex];
                final sectionData = groupedData[sectionName]!;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(sectionName),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1 / 1.1,
                      ),
                      itemCount: sectionData.length,
                      itemBuilder: (context, index) {
                        Map item = sectionData[index];
                        return ClickableTrashItem(item);
                      },
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
