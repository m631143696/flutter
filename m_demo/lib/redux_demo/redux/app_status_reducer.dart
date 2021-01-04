import 'package:redux/redux.dart';

import 'app_actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, StartLoading>(_setLoading),
  TypedReducer<bool, StopLoading>(_setLoaded),
]);

bool _setLoading(bool state, StartLoading action) {
  return true;
}

bool _setLoaded(bool state, StopLoading action) {
  return false;
}
