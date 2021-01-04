import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import '../../redux/user/user_state.dart';
import '../model/entities.dart';


// STARTER: import - do not remove comment

part 'serializers.g.dart';

@SerializersFor(const [
  UserState,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin(discriminator: EntityFields.entityName)))
    .build();
