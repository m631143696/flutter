import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../redux/user/user_state.dart';


part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  factory AppState({String appVer}) {
    return _$AppState._(
      isLoading: false,
      userState: UserState(),
    );
  }

  AppState._();

  bool get isLoading;

  UserState get userState;
// STARTER: state getters - do not remove comment

}
