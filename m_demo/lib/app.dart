import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:m_demo/redux_demo/redux_demo.dart';
import 'package:redux/redux.dart';

import 'redux_demo/redux/app_state.dart';

class MDemoApp extends StatefulWidget {
  final Store<AppState> store;
  const MDemoApp({Key key, this.store}) : super(key: key);
  @override
  MDemoAppState createState() => MDemoAppState();
}

class MDemoAppState extends State<MDemoApp> {
  @override
  Widget build(BuildContext context) {
    // return AppTheme(
    //   defaultBrightness: Brightness.light,
    //   themeDataWithBrightnessBuilder: (brightness) => ThemeData(
    //     primarySwatch: Colors.indigo,
    //     brightness: brightness,
    //   ),
    //   themeWidgetBuilder: (context, theme) {
    return MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark),
      title: '古月依稀',
      home: MainPage(),
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // primarySwatch: Colors.blue,
          // textTheme: TextTheme(
          //       title: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 17.0),
          //       button:
          //           TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal),
          //       display1: TextStyle(
          //         color: Colors.black87,
          //         fontSize: 17,
          //       ),
          //       display2:
          //           TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          //       display3: TextStyle(
          //           color: Colors.black54,
          //           fontSize: 13,
          //           fontWeight: FontWeight.normal),
          //       display4:
          //           TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
          //   splashColor: Colors.grey[250],
          //   highlightColor: Colors.transparent,
          //   backgroundColor: Color(0xffefeff4),
          //   // dividerColor: Color(0xff929195),
          //   dividerColor: Color(0xffc8c7cc),
          //   primaryTextTheme: TextTheme(
          //     title: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          //     subhead: CupertinoTheme.of(context)
          //         .textTheme
          //         .textStyle
          //         .copyWith(fontSize: 13, color: Colors.grey),
          //     body1: CupertinoTheme.of(context).textTheme.textStyle,
          //     body2: CupertinoTheme.of(context)
          //         .textTheme
          //         .textStyle
          //         .copyWith(color: Color(0xff8e8e93)),
          //   ),
          ),
      //  localizationsDelegates: [
      //     S.delegate,
      //     GlobalMaterialLocalizations.delegate,
      //     GlobalWidgetsLocalizations.delegate,
      //     const FallbackCupertinoLocalisationsDelegate(),
      //   ],
      //   supportedLocales: S.delegate.supportedLocales,
    );
    // },
    // );
  }
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RaisedButton(
          child:Text('redux_demo'),
          onPressed: () {
            
            Navigator.push(
                context,
                MaterialPageRoute(
                    settings: RouteSettings(name: ReduxDemo.route),
                    builder: (context) => ReduxDemo()));
          },
        ),
      ),
    );
  }
}
