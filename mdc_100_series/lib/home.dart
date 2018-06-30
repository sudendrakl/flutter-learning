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
import 'package:intl/intl.dart';

import 'model/data.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {
  ScrollController _scrollController = ScrollController();
  int _scrollDuration = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search Button');
              _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: Duration(seconds: _scrollDuration),
                  curve: Curves.linear);
              print ('going bottom');
            },
          ),
          IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: () {
              print('Alarm Button');
              _scrollController.animateTo(
                  _scrollController.position.minScrollExtent,
                  duration: Duration(seconds: _scrollDuration),
                  curve: Curves.linear);
              print('going top');
            },
          )
        ],
        leading: Icon(Icons.menu),
        title: Text('SHRINE'),
        centerTitle: true,
        elevation: 6.0,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _multiply(context), //_buildGridCards(context),
        controller: _scrollController,
      ),
    );
  }

  List<Card> _multiply(BuildContext context) {
    List<Card> multipliedList = _buildGridCards(context, 0);
    for (var i = 1; i < 500; i++) {
      multipliedList.addAll(_buildGridCards(context, i));
    }
    return multipliedList;
  }

  List<Card> _buildGridCards(BuildContext context, int page) {
    List<Product> products = getProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData themeData = Theme.of(context);
    final NumberFormat format = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    List<Card> cards = products.map((product) {
      return Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                  aspectRatio: 18.0 / 9.0,
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        product.assetName,
                        package: product.assetPackage,
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          "page $page",
                          style: themeData.textTheme.caption,
                          maxLines: 1,
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                    fit: StackFit.passthrough,
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: themeData.textTheme.title,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      format.format(product.price),
                      style: themeData.textTheme.body2,
                    )
                  ],
                ),
              )
            ]),
      );
    }).toList();

    return cards;
  }
}
