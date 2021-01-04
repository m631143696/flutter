import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'entity_action.g.dart';

/// EntityAction
class EntityAction extends EnumClass {
  const EntityAction._(String name) : super(name);

  static Serializer<EntityAction> get serializer => _$entityActionSerializer;

  static const EntityAction edit = _$edit;
  static const EntityAction archive = _$archive;
  static const EntityAction delete = _$delete;
  static const EntityAction restore = _$restore;
  static const EntityAction clone = _$clone;
  static const EntityAction convert = _$convert;
  static const EntityAction more = _$more;

//  static const EntityAction scan = _$scan;
//  static const EntityAction sendMessage = _$sendMessage;
//  static const EntityAction processImage = _$processImage;
  static const EntityAction save = _$save;
  static const EntityAction upload = _$upload;
  static const EntityAction download = _$download;

  static const EntityAction change = _$change;
//  static const EntityAction doOCR = _$doOCR;
//
//  static const EntityAction call = _$call;
//  static const EntityAction email = _$email;
//  static const EntityAction message = _$message;
//  static const EntityAction location = _$location;

  static BuiltSet<EntityAction> get values => _$values;
  static EntityAction valueOf(String name) => _$valueOf(name);
}

/// ActionStatus
class ActionStatus extends EnumClass {
  const ActionStatus._(String name) : super(name);

  static Serializer<ActionStatus> get serializer => _$actionStatusSerializer;

  static BuiltSet<ActionStatus> get values => _$actionStatus;
  static ActionStatus valueOf(String name) => _$actionStatusOf(name);

  static const ActionStatus initializing = _$initializing;
  static const ActionStatus pending = _$pending;
  static const ActionStatus paused = _$paused;
  static const ActionStatus fulfilled = _$fulfilled;
  static const ActionStatus rejected = _$rejected;
  static const ActionStatus cancelled = _$cancelled;
}
