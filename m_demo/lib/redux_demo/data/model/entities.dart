import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'entity_action.dart';
import 'serializers.dart';

part 'entities.g.dart';

enum MBoolType { FALSE, TRUE }

/// Entity Name Definitions.
class EntityName {
  static const dbVersion = 'DBVersion';
  static const test = 'test';

}

/// Field Name Definitions.
class EntityFields {

  static const String zPK = 'ZPK';
  static const String entityName = 'ZENTITY_NAME';

  static const String actionType = 'Z_ACTION_TYPE';
  static const String actionStatus = 'Z_ACTION_STATUS';

  static const List<String> allFields = [
    zPK,
    entityName,
    actionType,
    actionStatus
  ];
}


/// Entity Type Definitions.
class EntityType extends EnumClass {
  static Serializer<EntityType> get serializer => _$entityTypeSerializer;

  static const EntityType test = _$test;
  const EntityType._(String name) : super(name);

  String get plural {
    return this.toString() + 's';
  }

  static BuiltSet<EntityType> get values => _$typeValues;
  static EntityType valueOf(String name) => _$typeValueOf(name);
}

/// Base class of Entity Status.
abstract class EntityStatus {
  int get id;

  String get name;
}

/// Base class of Entity
abstract class BaseEntity {
  int getID() {
    return -1;
  }

  @BuiltValueField(wireName: EntityFields.entityName)
  EntityType get entityType => throw 'EntityType not set: ${this}';

  String get entityKey => '__${entityType}__${getID()}__';

  /// return the available action list.
  List<EntityAction> getBaseAction() {
    final actions = <EntityAction>[];

    actions.add(EntityAction.delete);

    return actions;
  }

  /// return true if the entity has not been achieved.
  bool get isNew {
    return this.getID() == null || this.getID() <= 0;
  }

  /// return true
  bool get isActive {
    return true;
  }

  bool get isDeleted {
    return false;
  }


  Object get insertValues  {

    if (this.getID() > 0) return null;

    var data = serializers.serialize(this);

    return data;
  }

}


enum ChangeFlag {
  none,
  insert,
  update,
  delete
}


abstract class MProgress implements Built<MProgress, MProgressBuilder> {
  factory MProgress({int totalCount = 0, int completedCount = 0}) {
    return _$MProgress._(
      totalCount: totalCount,
      completedCount: completedCount,
    );
  }

  MProgress._();

  int get totalCount;

  int get completedCount;

  double get fractionCompleted {
    if (totalCount <= 0) {
      return 0;
    }

    return completedCount / completedCount;
  }

  static Serializer<MProgress> get serializer => _$mProgressSerializer;

  @override
  String toString() {
    return super.toString() + '$completedCount/$totalCount';
  }
}