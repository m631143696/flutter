import 'package:redux/redux.dart';
import './user_state.dart';
import 'user_actions.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, LoginAction>(_handleLoginAction),
]);

UserState _handleLoginAction(UserState guideState, LoginAction action) {
  UserState newState;
  newState = guideState.rebuild((b) => b
    ..userName = action.userName ?? 'invalid value'
    ..userPassword = action.password ?? ''
    );

  return newState;
}
