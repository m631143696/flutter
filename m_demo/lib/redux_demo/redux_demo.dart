import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'ui/page/homePage.dart';
import 'theme/appTheme.dart';
import 'package:redux/redux.dart';
import 'package:m_demo/redux_demo/redux/app_state.dart';
import 'package:m_demo/redux_demo/ui/app/app_builder.dart';

import 'ui/view_model/user_vm.dart';

class ReduxDemo extends StatefulWidget {
  final Store<AppState> store;
  static const String route = '/redux_app/demo';
  const ReduxDemo({Key key, this.store}) : super(key: key);

  @override
  ReduxDemoState createState() => ReduxDemoState();
}

class ReduxDemoState extends State<ReduxDemo> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: AppBuilder(builder: (context) {
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
          home: HomePage(),
          initialRoute: '/login',
          onGenerateRoute: _getRoute,
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
      }),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginScreenBuilder(),
      fullscreenDialog: true,
    );
  }
}
