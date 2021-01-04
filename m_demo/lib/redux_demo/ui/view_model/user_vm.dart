import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:m_demo/redux_demo/redux/app_state.dart';
import 'package:m_demo/redux_demo/redux/user/user_actions.dart';
import 'package:m_demo/redux_demo/ui/page/accountPage.dart';
import 'package:redux/redux.dart';
import '../page/loginPage.dart';
import '../../redux/user/user_state.dart';

//login page builder
class LoginScreenBuilder extends StatelessWidget {
  const LoginScreenBuilder({
    Key key,
  }) : super(key: key);
  static const String route = '/ui/login';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserVM>(
      distinct: true,
      converter: (Store<AppState> store) {
        return UserVM.fromStore(store);
      },
      builder: (context, vm) {
        return LoginPage(
          viewModel: vm,
        );
      },
      onInit: (store) {},
    );
  }
}

//account page builder
class AccountScreenBuilder extends StatelessWidget {
  const AccountScreenBuilder({
    Key key,
  }) : super(key: key);
  static const String route = '/ui/account';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserVM>(
      distinct: true,
      converter: (Store<AppState> store) {
        return UserVM.fromStore(store);
      },
      builder: (context, vm) {
        return AccountPage(
          viewModel: vm,
        );
      },
      onInit: (store) {},
    );
  }
}

class UserVM {
  UserVM({
    this.userState,
    this.login,
  });

  factory UserVM.fromStore(Store<AppState> store) {
    final state = store.state;
    final userState = state.userState;
    return UserVM(
      userState: userState,
      login: (context,userName,password) {
        store.dispatch(LoginAction(userName,password));
        Navigator.pop(context);
      },
    );
  }
  final UserState userState;
  final Function(BuildContext context, String userName, String password) login;
}
