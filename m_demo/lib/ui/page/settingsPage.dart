import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_demo/theme/appTheme.dart';
import 'package:flutter/cupertino.dart';

bool _statusBarHidden = false;

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  StatusBarAnimation _statusBarAnimation = StatusBarAnimation.NONE;
  int radioValue = 0;

  Widget renderTitle(String text) {
    final textStyle = TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: CupertinoColors.inactiveGray);
    return Text(text, style: textStyle);
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  // void handleRadioValueChanged(int value) {
  //   setState(() {
  //     radioValue = value;
  //   });

  //   AppTheme.of(context)
  //       .setBrightness(value == 0 ? Brightness.light : Brightness.dark);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppTheme.of(context).brightness == Brightness.light
        //     ? Colors.white
        //     : CupertinoColors.black,
        title: Text(
          'Settings',
          style: TextStyle(
              // color: AppTheme.of(context).brightness == Brightness.light
              // ? Colors.black
              // : Colors.white,
              ),
        ),
        iconTheme: IconThemeData(color: CupertinoColors.activeBlue),
      ),
      body: new Container(
        // color: AppTheme.of(context).brightness == Brightness.light
        //     ? CupertinoColors.extraLightBackgroundGray
        //     : Colors.black,
        child: new Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment(-0.9, 0),
              padding: EdgeInsets.only(left: 3),
              child: renderTitle("System Settings"),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(height: 1, color: CupertinoColors.inactiveGray),
            Container(
              // color: AppTheme.of(context).brightness == Brightness.light
              //     ? CupertinoColors.white
              //     : CupertinoColors.darkBackgroundGray,
              height: 40,
              padding: EdgeInsets.only(left: 10),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Status Bar Hidden",
                        style: TextStyle(
                          fontSize: 18,
                          // color: AppTheme.of(context).brightness ==
                          //         Brightness.light
                          //     ? Colors.black
                          //     : Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 194),
                      child: CupertinoSwitch(
                        value: _statusBarHidden,
                        onChanged: (bool val) {
                          this.setState(() {
                            _statusBarHidden = val;
                          });
                          FlutterStatusbarManager.setHidden(_statusBarHidden,
                              animation: _statusBarAnimation);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: RaisedButton(
                        onPressed: _neverSatisfied,
                      ),
                    )
                  ],
                ),
                // SwitchListTile(
                //   title: new Text(
                //     "Hidden:",
                //     style: TextStyle(
                //       color: AppTheme.of(context).brightness == Brightness.light
                //           ? Colors.black
                //           : Colors.white,
                //     ),
                //   ),
                //   value: _statusBarHidden,
                //   onChanged: (bool val) {
                //     this.setState(() {
                //       _statusBarHidden = val;
                //     });
                //     FlutterStatusbarManager.setHidden(_statusBarHidden,
                //         animation: _statusBarAnimation);
                //   },
                // ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Container(
              // color: AppTheme.of(context).brightness == Brightness.light
              //     ? CupertinoColors.white
              //     : CupertinoColors.darkBackgroundGray,
              height: 40,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Dark Appearence",
                      style: TextStyle(
                        fontSize: 18,
                        // color:
                        // AppTheme.of(context).brightness == Brightness.light
                        //     ? Colors.black
                        //     : Colors.white,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 200),
                  //   child: CupertinoSwitch(
                  //     value: AppTheme.of(context).brightness == Brightness.light
                  //         ? false
                  //         : true,
                  //     onChanged: (bool val) {
                  //       AppTheme.of(context).setBrightness(
                  //           val == false ? Brightness.light : Brightness.dark);
                  //     },
                  //   ),
                  // ),
                ],
              ),
              // SwitchListTile(
              //   title: new Text(
              //     "DarkMode:",
              //     style: TextStyle(
              //       color: AppTheme.of(context).brightness == Brightness.light
              //           ? Colors.black
              //           : Colors.white,
              //     ),
              //   ),
              //   value: AppTheme.of(context).brightness == Brightness.light
              //       ? false
              //       : true,
              //   onChanged: (bool val) {
              //     AppTheme.of(context).setBrightness(
              //         val == false ? Brightness.light : Brightness.dark);
              //   },
              // ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment(-0.9, 0),
              child: renderTitle("Other Settings"),
            ),
            SizedBox(
              height: 10,
            ),

            // Expanded(
            //     child: Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: Container(
            //         child: Radio<int>(
            //           value: 0,
            //           groupValue: radioValue,
            //           onChanged: handleRadioValueChanged,
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Container(
            //         child: Radio<int>(
            //           value: 1,
            //           groupValue: radioValue,
            //           onChanged: handleRadioValueChanged,
            //         ),
            //       ),
            //     ),
            //   ],
            // )),
          ],
        ),
      ),
    );
  }
}

class FlutterStatusbarManager {
  static const MethodChannel _channel =
      const MethodChannel('flutter_statusbar_manager');
  static Future<bool> setHidden(bool hidden,
      {StatusBarAnimation animation = StatusBarAnimation.NONE}) async {
    return await _channel.invokeMethod("setHidden", {
      'hidden': hidden,
      'animation': _StatusBarAnimation.getAnimation(animation)
    });
  }
}

enum StatusBarAnimation { NONE, FADE, SLIDE }

class _StatusBarAnimation {
  static const String NONE = "none";
  static const String FADE = "fade";
  static const String SLIDE = "slide";

  static String getAnimation(StatusBarAnimation animation) {
    switch (animation) {
      case StatusBarAnimation.NONE:
        return NONE;
      case StatusBarAnimation.FADE:
        return FADE;
      case StatusBarAnimation.SLIDE:
        return SLIDE;
      default:
        return NONE;
    }
  }
}
