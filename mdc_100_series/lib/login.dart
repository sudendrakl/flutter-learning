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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  void clear() {
    _userNameController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              const SizedBox(height: 80.0),
              new Column(
                children: <Widget>[
                  new Image.asset('assets/diamond.png'),
                  const SizedBox(height: 16.0),
                  const Text('SHRINE'),
                ],
              ),
              const SizedBox(height: 100.0),
              TextField(
                decoration:
                    InputDecoration(filled: true, labelText: 'Username'),
                keyboardType: TextInputType.emailAddress,
                key: Key('uname'),
                controller: _userNameController,
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration:
                    InputDecoration(filled: true, labelText: 'Password'),
                obscureText: true,
                key: Key('passwd'),
                controller: _passwordController,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: clear,
                  ),
                  RaisedButton(
                      child: Text('NEXT'),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              )
            ]),
      ),
    );
  }
}
