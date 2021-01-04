import 'app_state.dart';
import 'app_status_reducer.dart';
import './user/user_reducer.dart';



AppState appReducer(AppState state, dynamic action) {


  var result = state.rebuild((b) => b
    ..isLoading = loadingReducer(state.isLoading, action)
    ..userState.replace(userReducer(state.userState,action))
  );
  return result;
}
