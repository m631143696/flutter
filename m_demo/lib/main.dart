import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'app.dart';
import 'redux/app_reducer.dart';
import 'redux/app_state.dart';

// void main() => runApp(DemoApp());
void main() async {
  final store = Store<AppState>(appReducer,
      initialState: AppState(),
      );
  runApp(DemoApp(store: store));
}
