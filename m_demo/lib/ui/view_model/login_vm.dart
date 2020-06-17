import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:m_demo/redux/app_state.dart';
import 'package:redux/redux.dart';
import '../page/loginPage.dart';
import '../../redux/user/user_state.dart';

class LoginScreenBuilder extends StatelessWidget {
  const LoginScreenBuilder({
    Key key,
  }) : super(key: key);
  static const String route = '/ui/login';

  @override
  Widget build(BuildContext context) {
    log('buildchenggong');
    return StoreConnector<AppState, LoginVM>(
      distinct: true,
      converter: (Store<AppState> store) {
        return LoginVM.fromStore(store);
      },
      builder: (context, vm) {
        log('builder 2 chenggong');
        return LoginPage(
          viewModel: vm,
        );
      },
      onInit: (store) {},
    );
  }
}

class LoginVM {
  LoginVM({
    this.userState,
    this.login,
  });

  factory LoginVM.fromStore(Store<AppState> store) {
    final state = store.state;
    final userState = state.userState;
    return LoginVM(
      userState: userState,
      login: (context) {
        Navigator.pop(context);
      },
    );
  }
  final UserState userState;
  // final Function(BuildContext context, String userName, String password) login;
  final Function(BuildContext context) login;
}
