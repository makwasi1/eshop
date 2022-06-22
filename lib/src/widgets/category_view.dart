import 'package:eshop/src/constants.dart';
import 'package:eshop/src/widgets/categoty_items.dart';
import 'package:flutter/material.dart';

class Categoryview extends StatelessWidget {
  final int column, items;
  final Widget child;
  final Color color;
  final double ratio, height, width;
  final direction, itemBuilder;
  const Categoryview({
    Key key,
    this.column,
    this.items,
    this.child,
    this.color,
    this.ratio,
    this.height,
    this.width,
    this.direction,
    this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Column(children: <Widget>[
            GestureDetector(
              onTap: () {
                print("taped");
              },
              child: CategoryItems(
                title: categoryList[index].category,
              ),
            ),
            // ListTile(title: Text(categoryList[index].category),),
            const Divider()
          ]);
        });
  }
}

