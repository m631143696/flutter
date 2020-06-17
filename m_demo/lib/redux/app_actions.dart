import 'package:flutter/material.dart';

import 'app_state.dart';

class InitAppStateStartAction {
  final BuildContext context;
  InitAppStateStartAction(this.context);
}

class InitAppStateSuccessAction {
  final AppState state;
  InitAppStateSuccessAction(this.state);
}

class AppActionCreator {}

class PersistData {}
class PersistUI {}

class StartLoading {}
class StopLoading {}


abstract class BaseFailureAction {
  BaseFailureAction(this.error);

  final dynamic error;

  @override
  String toString() {
    return 'BaseFailureAction{error: $error}';
  }
}
