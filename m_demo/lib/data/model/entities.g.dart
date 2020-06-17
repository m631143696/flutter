// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EntityType _$test = const EntityType._('test');

EntityType _$typeValueOf(String name) {
  switch (name) {
    case 'test':
      return _$test;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EntityType> _$typeValues =
    new BuiltSet<EntityType>(const <EntityType>[
  _$test,
]);

Serializer<EntityType> _$entityTypeSerializer = new _$EntityTypeSerializer();
Serializer<MProgress> _$mProgressSerializer = new _$MProgressSerializer();

class _$EntityTypeSerializer implements PrimitiveSerializer<EntityType> {
  @override
  final Iterable<Type> types = const <Type>[EntityType];
  @override
  final String wireName = 'EntityType';

  @override
  Object serialize(Serializers serializers, EntityType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  EntityType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EntityType.valueOf(serialized as String);
}

class _$MProgressSerializer implements StructuredSerializer<MProgress> {
  @override
  final Iterable<Type> types = const [MProgress, _$MProgress];
  @override
  final String wireName = 'MProgress';

  @override
  Iterable<Object> serialize(Serializers serializers, MProgress object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'totalCount',
      serializers.serialize(object.totalCount,
          specifiedType: const FullType(int)),
      'completedCount',
      serializers.serialize(object.completedCount,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  MProgress deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MProgressBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'totalCount':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'completedCount':
          result.completedCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MProgress extends MProgress {
  @override
  final int totalCount;
  @override
  final int completedCount;

  factory _$MProgress([void Function(MProgressBuilder) updates]) =>
      (new MProgressBuilder()..update(updates)).build();

  _$MProgress._({this.totalCount, this.completedCount}) : super._() {
    if (totalCount == null) {
      throw new BuiltValueNullFieldError('MProgress', 'totalCount');
    }
    if (completedCount == null) {
      throw new BuiltValueNullFieldError('MProgress', 'completedCount');
    }
  }

  @override
  MProgress rebuild(void Function(MProgressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MProgressBuilder toBuilder() => new MProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MProgress &&
        totalCount == other.totalCount &&
        completedCount == other.completedCount;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, totalCount.hashCode), completedCount.hashCode));
  }
}

class MProgressBuilder implements Builder<MProgress, MProgressBuilder> {
  _$MProgress _$v;

  int _totalCount;
  int get totalCount => _$this._totalCount;
  set totalCount(int totalCount) => _$this._totalCount = totalCount;

  int _completedCount;
  int get completedCount => _$this._completedCount;
  set completedCount(int completedCount) =>
      _$this._completedCount = completedCount;

  MProgressBuilder();

  MProgressBuilder get _$this {
    if (_$v != null) {
      _totalCount = _$v.totalCount;
      _completedCount = _$v.completedCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MProgress other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MProgress;
  }

  @override
  void update(void Function(MProgressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MProgress build() {
    final _$result = _$v ??
        new _$MProgress._(
            totalCount: totalCount, completedCount: completedCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
