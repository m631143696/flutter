import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../view_model/login_vm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.viewModel}) : super(key: key);
  final LoginVM viewModel;
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pswController = TextEditingController();
  bool _nameIsComposing = false;
  bool _pswIsComposing = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('images/login.jpg'),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'M',
                  style: new TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.0),
            AccentColorOverride(
              color: Colors.blue,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  // filled: true,
                  labelText: 'Username',
                  labelStyle: new TextStyle(
                    fontFamily: 'GreatVibes',
                    fontSize: 18,
                  ),
                ),
                onChanged: (String text) {
                  setState(() {
                    _nameIsComposing = text.length > 0;
                  });
                },
              ),
            ),

            SizedBox(
              height: 12.0,
            ),

            ///password
            AccentColorOverride(
              color: Colors.blue,
              child: TextField(
                controller: pswController,
                decoration: InputDecoration(
                  // filled: true,
                  labelText: 'Password',
                  labelStyle: new TextStyle(
                    fontFamily: 'GreatVibes',
                    fontSize: 18,
                  ),
                ),
                obscureText: true,
                onChanged: (String text) {
                  setState(() {
                    _pswIsComposing = text.length > 0;
                  });
                },
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Cannel',
                      style: new TextStyle(
                        fontFamily: 'MrDeHaviland',
                        fontSize: 22,
                      )),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  onPressed: () {
                    setState(() {
                      nameController.clear();
                      pswController.clear();
                      _nameIsComposing = false;
                      _pswIsComposing = false;
                    });
                  },
                ),
                RaisedButton(
                    elevation: 4,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: new Text('Next',
                        style: new TextStyle(
                          fontFamily: 'MrDeHaviland',
                          fontSize: 22,
                        )),
                    onPressed: _pswIsComposing && _nameIsComposing
                        ? () {
                            log('$_pswIsComposing, $_nameIsComposing');
                            setState(() {
                              _nameIsComposing = false;
                              _pswIsComposing = false;
                            });
                            widget.viewModel.login(context);
                          }
                        : null),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}
