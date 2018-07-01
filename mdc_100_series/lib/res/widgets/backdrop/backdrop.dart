import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../model/product.dart';
import 'backdrop-state.dart';

class BackDrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontLayer, backLayer, frontTitle, backTitle;

  const BackDrop({
    @required this.currentCategory,
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
  })  : assert(currentCategory != null),
        assert(frontLayer != null),
        assert(backLayer != null),
        assert(frontTitle != null),
        assert(backTitle != null);

  @override
  BackDropState createState() => BackDropState();
}
