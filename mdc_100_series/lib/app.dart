// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'home-backdrop.dart';
import 'login.dart';
import 'model/product.dart';
import 'res/themes.dart';
import 'res/widgets/backdrop/backdrop.dart';
import 'res/widgets/category_menu_page.dart';

class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() {
    return _ShrineAppState();
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() => _currentCategory = category);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      //home: HomePage(),
      home: BackDrop(
          //todo: change home: to a backdrop with a HomePage frontLayer
          currentCategory: Category.all,
          //todo: make currentCategory take _currentCategory
          frontLayer: HomePageBackDrop(category: _currentCategory),
          //todo: pass _currentCategory for frontLayer
          backLayer: CategoryMenuPage(
            currentCategory: _currentCategory,
            onCategoryTap: _onCategoryTap,
          ),
          //todo: change backLayer field value to CategoryMenuPage
          frontTitle: Text('SHRINE'),
          backTitle: Text('MENU')),
      initialRoute: '/login',
      onGenerateRoute: widget._getRoute,
      theme: shrineTheme(),
    );
  }
}
