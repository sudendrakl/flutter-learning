import 'package:flutter/material.dart';

class FrontLayer extends StatelessWidget {
  //todo: add on-tap callback
  final Widget child;
  final VoidCallback onTap;

  const FrontLayer({
    Key key,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(
              height: 40.0,
              alignment: AlignmentDirectional.centerStart,
            ),
          ),
          //todo: add a GestureDetector
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}
