// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:flutter_ios_dark_mode/flutter_ios_dark_mode.dart';

// ///theme widgetBuilder
// typedef ThemeWidgetBuilder = Widget Function(
//     BuildContext context, ThemeData data);

// //
// typedef ThemeDataWithBrightnessBuilder = ThemeData Function(
//     Brightness brightness);

// class AppTheme extends StatefulWidget {
//   AppTheme(
//       {this.defaultBrightness,
//       this.themeDataWithBrightnessBuilder,
//       this.themeWidgetBuilder});
//   final Brightness defaultBrightness;
//   final ThemeWidgetBuilder themeWidgetBuilder;
//   final ThemeDataWithBrightnessBuilder themeDataWithBrightnessBuilder;

//   @override
//   AppThemeState createState() => AppThemeState();

//   //Returns the State object of the nearest ancestor StatefulWidget widget that matches the given TypeMatcher.
//   static AppThemeState of(BuildContext context) {
//     return context.ancestorStateOfType(const TypeMatcher<AppThemeState>());
//   }
// }

// class AppThemeState extends State<AppTheme> {
//   ThemeData _themeData;

//   Brightness _brightness;

//   static const String _sharedPreferencesKey = 'dark';

//   ThemeData get data => _themeData;

//   Brightness get brightness => _brightness;

//   Future<bool> updateThemeByplatform() async {
//     // Get current state
//     final bool darkModeEnabled = await FlutterIosDarkMode().darkModeEnabled;
//     return darkModeEnabled;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _brightness = widget.defaultBrightness;
//     _themeData = widget.themeDataWithBrightnessBuilder(_brightness);

//     loadBrightness().then((bool dark) {
//       // _brightness = widget.defaultBrightness;
//       // _themeData = widget.themeDataWithBrightnessBuilder(_brightness);
//       updateThemeByplatform().then((isDark) {
//         if (isDark) {
//           _brightness = Brightness.dark;
//         } else {
//           _brightness = Brightness.light;
//         }
//         _themeData = widget.themeDataWithBrightnessBuilder(_brightness);
//       });
//     });

//     FlutterIosDarkMode()
//         .onDarkModeStateChanged
//         .listen((bool darkModeEnabled) {
//           if(darkModeEnabled){
//             _brightness = Brightness.dark;
//           }else{
//             _brightness = Brightness.light;
//           }
//         });
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _themeData = widget.themeDataWithBrightnessBuilder(_brightness);
//   }

//   //Called whenever the widget configuration changes.
//   @override
//   void didUpdateWidget(AppTheme oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _themeData = widget.themeDataWithBrightnessBuilder(_brightness);
//   }

//   Future<void> setBrightness(Brightness brightness) async {
//     setState(() {
//       _brightness = brightness;
//       _themeData = widget.themeDataWithBrightnessBuilder(brightness);
//     });
//     // final
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     await preferences.setBool(
//         _sharedPreferencesKey, brightness == Brightness.dark ? true : false);
//   }

//   void setThemeData(ThemeData themeData) {
//     setState(() {
//       _themeData = themeData;
//     });
//   }

//   Future<bool> loadBrightness() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     return preferences.getBool(_sharedPreferencesKey) ??
//         widget.defaultBrightness == Brightness.dark;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.themeWidgetBuilder(context, _themeData);
//   }
// }
