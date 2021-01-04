import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'redux_demo/redux_demo.dart';
import 'redux_demo/redux/app_reducer.dart';
import 'redux_demo/redux/app_state.dart';
import 'app.dart';

// void main() => runApp(DemoApp());
void main() async {
  final store = Store<AppState>(appReducer,
      initialState: AppState(),
      );
  runApp(MDemoApp(store: store));
}
