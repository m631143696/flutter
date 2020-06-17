import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert';
import 'package:m_demo/data/model/serializers.dart';
part 'user_state.g.dart';

abstract class UserState implements Built<UserState, UserStateBuilder> {
  UserState._();

  factory UserState() {
    return _$UserState._();
  }

  @BuiltValueField(wireName: 'UserPassword')
  @nullable
  String get userPassword;

  @BuiltValueField(wireName: 'UserName')
  @nullable
  String get userName;



  String toJson() {
    return json.encode(serializers.serializeWith(UserState.serializer, this));
  }

  static UserState fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserState.serializer, json.decode(jsonString));
  }

  static Serializer<UserState> get serializer => _$userStateSerializer;
}
