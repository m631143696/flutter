// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_action.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EntityAction _$edit = const EntityAction._('edit');
const EntityAction _$archive = const EntityAction._('archive');
const EntityAction _$delete = const EntityAction._('delete');
const EntityAction _$restore = const EntityAction._('restore');
const EntityAction _$clone = const EntityAction._('clone');
const EntityAction _$convert = const EntityAction._('convert');
const EntityAction _$more = const EntityAction._('more');
const EntityAction _$save = const EntityAction._('save');
const EntityAction _$upload = const EntityAction._('upload');
const EntityAction _$download = const EntityAction._('download');
const EntityAction _$change = const EntityAction._('change');

EntityAction _$valueOf(String name) {
  switch (name) {
    case 'edit':
      return _$edit;
    case 'archive':
      return _$archive;
    case 'delete':
      return _$delete;
    case 'restore':
      return _$restore;
    case 'clone':
      return _$clone;
    case 'convert':
      return _$convert;
    case 'more':
      return _$more;
    case 'save':
      return _$save;
    case 'upload':
      return _$upload;
    case 'download':
      return _$download;
    case 'change':
      return _$change;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EntityAction> _$values =
    new BuiltSet<EntityAction>(const <EntityAction>[
  _$edit,
  _$archive,
  _$delete,
  _$restore,
  _$clone,
  _$convert,
  _$more,
  _$save,
  _$upload,
  _$download,
  _$change,
]);

const ActionStatus _$initializing = const ActionStatus._('initializing');
const ActionStatus _$pending = const ActionStatus._('pending');
const ActionStatus _$paused = const ActionStatus._('paused');
const ActionStatus _$fulfilled = const ActionStatus._('fulfilled');
const ActionStatus _$rejected = const ActionStatus._('rejected');
const ActionStatus _$cancelled = const ActionStatus._('cancelled');

ActionStatus _$actionStatusOf(String name) {
  switch (name) {
    case 'initializing':
      return _$initializing;
    case 'pending':
      return _$pending;
    case 'paused':
      return _$paused;
    case 'fulfilled':
      return _$fulfilled;
    case 'rejected':
      return _$rejected;
    case 'cancelled':
      return _$cancelled;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ActionStatus> _$actionStatus =
    new BuiltSet<ActionStatus>(const <ActionStatus>[
  _$initializing,
  _$pending,
  _$paused,
  _$fulfilled,
  _$rejected,
  _$cancelled,
]);

Serializer<EntityAction> _$entityActionSerializer =
    new _$EntityActionSerializer();
Serializer<ActionStatus> _$actionStatusSerializer =
    new _$ActionStatusSerializer();

class _$EntityActionSerializer implements PrimitiveSerializer<EntityAction> {
  @override
  final Iterable<Type> types = const <Type>[EntityAction];
  @override
  final String wireName = 'EntityAction';

  @override
  Object serialize(Serializers serializers, EntityAction object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  EntityAction deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EntityAction.valueOf(serialized as String);
}

class _$ActionStatusSerializer implements PrimitiveSerializer<ActionStatus> {
  @override
  final Iterable<Type> types = const <Type>[ActionStatus];
  @override
  final String wireName = 'ActionStatus';

  @override
  Object serialize(Serializers serializers, ActionStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ActionStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ActionStatus.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
