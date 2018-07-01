import 'package:flutter/material.dart';

import '../../../login.dart';
import 'backdrop-title.dart';
import 'backdrop.dart';
import 'frontlayer.dart';

class BackDropState extends State<BackDrop>
    with SingleTickerProviderStateMixin {
  //todo : add AnimationControler widget

  final double _kFLingVelocity = 2.0;
  final GlobalKey _backDropKey = GlobalKey(debugLabel: 'BackDrop');
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      value: 1.0,
    );
  }

  // todo : add override didUpdateWidget
  @override
  void didUpdateWidget(BackDrop old) {
    super.didUpdateWidget(old);

    if (widget.currentCategory != old.currentCategory) {
      _toggleBackDropVisibility();
    } else if (!_frontLayerVisible) {
      _controller.fling(velocity: _kFLingVelocity);
    }
  }

  //todo: add buildcontext &BoxConstraints params to _buildStack
  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = 48.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;

    //todo: create a RelativeRectTween Animation
    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          0.0, layerTop, 0.0, layerTop - layerSize.height),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_controller.view);

    return Stack(
      key: _backDropKey,
      children: <Widget>[
        widget.backLayer,
        //todo: add PositionedTransition
        PositionedTransition(
          rect: layerAnimation,
          child: FrontLayer(
            //todo: implement onTapProperty on _BackDropState
            onTap: _toggleBackDropVisibility,
            child: widget.frontLayer,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      //todo: replace leading menu icon with IconButton
      //todo: remove leading property
      //todo: create title with _BackDropTitle parameter,
      title: BackDropTitle(
        frontTitle: widget.frontTitle,
        backTitle: widget.backTitle,
        listenable: _controller.view,
        onPress: _toggleBackDropVisibility,
      ),
      actions: <Widget>[
        //todo : add shortcut to login screen from trailing icons
        IconButton(
          icon: Icon(Icons.search),
          onPressed: _openLogin, //todo: add open login
        ),
        IconButton(
          icon: Icon(Icons.tune),
          onPressed: _openLogin, //todo: add open login
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      //todo: return a layout builder widget
      body: LayoutBuilder(builder: _buildStack),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//todo: add functions to get & change front layer visibility
  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackDropVisibility() {
    _controller.fling(
        velocity: _frontLayerVisible ? -_kFLingVelocity : _kFLingVelocity);
  }

  void _openLogin() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }
}
