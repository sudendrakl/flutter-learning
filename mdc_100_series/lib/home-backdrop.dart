import 'package:flutter/material.dart';

import 'model/data.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';

class HomePageBackDrop extends StatelessWidget {
  //todo: add a variable for category
  final Category category;

  const HomePageBackDrop({this.category: Category.all});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AsymmetricView(
          products: getProducts(category),
        ),
      );
}
