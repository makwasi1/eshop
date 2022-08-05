import 'package:eshop/src/bloc/products/product_bloc.dart';
import 'package:eshop/src/category/category.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/models/categories_model.dart';
import 'package:eshop/src/services/products_repo.dart';
import 'package:eshop/src/widgets/categoty_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categoryview extends StatelessWidget {
  final List<Categories> categories;
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
    this.itemBuilder, this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductsLoadedState){
            return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              return Column(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print("taped");
                  },
                  child: CategoryItems(
                    title: state.categories[index].name,
                  ),
                ),
                // ListTile(title: Text(categoryList[index].category),),
                const Divider()
              ]);
            });
        }
        return Container();
      },
    );
  }
}
