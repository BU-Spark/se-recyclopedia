import 'package:flutter/material.dart';
import 'package:recyclopedia/widgets/all.dart';

class ItemModal extends StatelessWidget {
  final String itemName;
  final String itemImage;
  final List<String> recycleInformation;

  const ItemModal(this.itemName, this.itemImage, this.recycleInformation,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), alignment: Alignment.center);

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('歪比巴卜'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading1(itemName),
            ItemPreview({"name": itemName, "image": itemImage}),
            Heading2("more information"),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                // Let the ListView know how many items it needs to build.
                itemCount: recycleInformation.length,
                // Provide a builder function. This is where the magic happens.
                // Convert each item into a widget based on the type of item it is.
                itemBuilder: (context, index) {
                  final item = recycleInformation[index];
                  return ListTile(
                      leading: Icon(Icons.recycling), title: Text(item));
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                style: style,
                onPressed: () {},
                child: const Text('Find Bin'),
              ),
            ),
            Container(),
            Container()
          ],
        ),
      ),
    );
  }
}
