// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkSession {

 int get id; int get motorcycleId; String get platform; int get kilometersStart; int get goalProfit; String get fuelCondition; int? get kilometersFinish; String get status; int get distance; int get income; int get totalOrder; DateTime? get startedAt; DateTime? get endedAt;
/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkSessionCopyWith<WorkSession> get copyWith => _$WorkSessionCopyWithImpl<WorkSession>(this as WorkSession, _$identity);

  /// Serializes this WorkSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkSession&&(identical(other.id, id) || other.id == id)&&(identical(other.motorcycleId, motorcycleId) || other.motorcycleId == motorcycleId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.kilometersStart, kilometersStart) || other.kilometersStart == kilometersStart)&&(identical(other.goalProfit, goalProfit) || other.goalProfit == goalProfit)&&(identical(other.fuelCondition, fuelCondition) || other.fuelCondition == fuelCondition)&&(identical(other.kilometersFinish, kilometersFinish) || other.kilometersFinish == kilometersFinish)&&(identical(other.status, status) || other.status == status)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.income, income) || other.income == income)&&(identical(other.totalOrder, totalOrder) || other.totalOrder == totalOrder)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,motorcycleId,platform,kilometersStart,goalProfit,fuelCondition,kilometersFinish,status,distance,income,totalOrder,startedAt,endedAt);

@override
String toString() {
  return 'WorkSession(id: $id, motorcycleId: $motorcycleId, platform: $platform, kilometersStart: $kilometersStart, goalProfit: $goalProfit, fuelCondition: $fuelCondition, kilometersFinish: $kilometersFinish, status: $status, distance: $distance, income: $income, totalOrder: $totalOrder, startedAt: $startedAt, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class $WorkSessionCopyWith<$Res>  {
  factory $WorkSessionCopyWith(WorkSession value, $Res Function(WorkSession) _then) = _$WorkSessionCopyWithImpl;
@useResult
$Res call({
 int id, int motorcycleId, String platform, int kilometersStart, int goalProfit, String fuelCondition, int? kilometersFinish, String status, int distance, int income, int totalOrder, DateTime? startedAt, DateTime? endedAt
});




}
/// @nodoc
class _$WorkSessionCopyWithImpl<$Res>
    implements $WorkSessionCopyWith<$Res> {
  _$WorkSessionCopyWithImpl(this._self, this._then);

  final WorkSession _self;
  final $Res Function(WorkSession) _then;

/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? motorcycleId = null,Object? platform = null,Object? kilometersStart = null,Object? goalProfit = null,Object? fuelCondition = null,Object? kilometersFinish = freezed,Object? status = null,Object? distance = null,Object? income = null,Object? totalOrder = null,Object? startedAt = freezed,Object? endedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,motorcycleId: null == motorcycleId ? _self.motorcycleId : motorcycleId // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,kilometersStart: null == kilometersStart ? _self.kilometersStart : kilometersStart // ignore: cast_nullable_to_non_nullable
as int,goalProfit: null == goalProfit ? _self.goalProfit : goalProfit // ignore: cast_nullable_to_non_nullable
as int,fuelCondition: null == fuelCondition ? _self.fuelCondition : fuelCondition // ignore: cast_nullable_to_non_nullable
as String,kilometersFinish: freezed == kilometersFinish ? _self.kilometersFinish : kilometersFinish // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,totalOrder: null == totalOrder ? _self.totalOrder : totalOrder // ignore: cast_nullable_to_non_nullable
as int,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkSession].
extension WorkSessionPatterns on WorkSession {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkSession() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkSession value)  $default,){
final _that = this;
switch (_that) {
case _WorkSession():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkSession value)?  $default,){
final _that = this;
switch (_that) {
case _WorkSession() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int motorcycleId,  String platform,  int kilometersStart,  int goalProfit,  String fuelCondition,  int? kilometersFinish,  String status,  int distance,  int income,  int totalOrder,  DateTime? startedAt,  DateTime? endedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkSession() when $default != null:
return $default(_that.id,_that.motorcycleId,_that.platform,_that.kilometersStart,_that.goalProfit,_that.fuelCondition,_that.kilometersFinish,_that.status,_that.distance,_that.income,_that.totalOrder,_that.startedAt,_that.endedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int motorcycleId,  String platform,  int kilometersStart,  int goalProfit,  String fuelCondition,  int? kilometersFinish,  String status,  int distance,  int income,  int totalOrder,  DateTime? startedAt,  DateTime? endedAt)  $default,) {final _that = this;
switch (_that) {
case _WorkSession():
return $default(_that.id,_that.motorcycleId,_that.platform,_that.kilometersStart,_that.goalProfit,_that.fuelCondition,_that.kilometersFinish,_that.status,_that.distance,_that.income,_that.totalOrder,_that.startedAt,_that.endedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int motorcycleId,  String platform,  int kilometersStart,  int goalProfit,  String fuelCondition,  int? kilometersFinish,  String status,  int distance,  int income,  int totalOrder,  DateTime? startedAt,  DateTime? endedAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkSession() when $default != null:
return $default(_that.id,_that.motorcycleId,_that.platform,_that.kilometersStart,_that.goalProfit,_that.fuelCondition,_that.kilometersFinish,_that.status,_that.distance,_that.income,_that.totalOrder,_that.startedAt,_that.endedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkSession implements WorkSession {
  const _WorkSession({required this.id, required this.motorcycleId, required this.platform, required this.kilometersStart, required this.goalProfit, required this.fuelCondition, this.kilometersFinish, this.status = "ACTIVE", this.distance = 0, this.income = 0, this.totalOrder = 0, this.startedAt, this.endedAt});
  factory _WorkSession.fromJson(Map<String, dynamic> json) => _$WorkSessionFromJson(json);

@override final  int id;
@override final  int motorcycleId;
@override final  String platform;
@override final  int kilometersStart;
@override final  int goalProfit;
@override final  String fuelCondition;
@override final  int? kilometersFinish;
@override@JsonKey() final  String status;
@override@JsonKey() final  int distance;
@override@JsonKey() final  int income;
@override@JsonKey() final  int totalOrder;
@override final  DateTime? startedAt;
@override final  DateTime? endedAt;

/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkSessionCopyWith<_WorkSession> get copyWith => __$WorkSessionCopyWithImpl<_WorkSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkSession&&(identical(other.id, id) || other.id == id)&&(identical(other.motorcycleId, motorcycleId) || other.motorcycleId == motorcycleId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.kilometersStart, kilometersStart) || other.kilometersStart == kilometersStart)&&(identical(other.goalProfit, goalProfit) || other.goalProfit == goalProfit)&&(identical(other.fuelCondition, fuelCondition) || other.fuelCondition == fuelCondition)&&(identical(other.kilometersFinish, kilometersFinish) || other.kilometersFinish == kilometersFinish)&&(identical(other.status, status) || other.status == status)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.income, income) || other.income == income)&&(identical(other.totalOrder, totalOrder) || other.totalOrder == totalOrder)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,motorcycleId,platform,kilometersStart,goalProfit,fuelCondition,kilometersFinish,status,distance,income,totalOrder,startedAt,endedAt);

@override
String toString() {
  return 'WorkSession(id: $id, motorcycleId: $motorcycleId, platform: $platform, kilometersStart: $kilometersStart, goalProfit: $goalProfit, fuelCondition: $fuelCondition, kilometersFinish: $kilometersFinish, status: $status, distance: $distance, income: $income, totalOrder: $totalOrder, startedAt: $startedAt, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class _$WorkSessionCopyWith<$Res> implements $WorkSessionCopyWith<$Res> {
  factory _$WorkSessionCopyWith(_WorkSession value, $Res Function(_WorkSession) _then) = __$WorkSessionCopyWithImpl;
@override @useResult
$Res call({
 int id, int motorcycleId, String platform, int kilometersStart, int goalProfit, String fuelCondition, int? kilometersFinish, String status, int distance, int income, int totalOrder, DateTime? startedAt, DateTime? endedAt
});




}
/// @nodoc
class __$WorkSessionCopyWithImpl<$Res>
    implements _$WorkSessionCopyWith<$Res> {
  __$WorkSessionCopyWithImpl(this._self, this._then);

  final _WorkSession _self;
  final $Res Function(_WorkSession) _then;

/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? motorcycleId = null,Object? platform = null,Object? kilometersStart = null,Object? goalProfit = null,Object? fuelCondition = null,Object? kilometersFinish = freezed,Object? status = null,Object? distance = null,Object? income = null,Object? totalOrder = null,Object? startedAt = freezed,Object? endedAt = freezed,}) {
  return _then(_WorkSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,motorcycleId: null == motorcycleId ? _self.motorcycleId : motorcycleId // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,kilometersStart: null == kilometersStart ? _self.kilometersStart : kilometersStart // ignore: cast_nullable_to_non_nullable
as int,goalProfit: null == goalProfit ? _self.goalProfit : goalProfit // ignore: cast_nullable_to_non_nullable
as int,fuelCondition: null == fuelCondition ? _self.fuelCondition : fuelCondition // ignore: cast_nullable_to_non_nullable
as String,kilometersFinish: freezed == kilometersFinish ? _self.kilometersFinish : kilometersFinish // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,totalOrder: null == totalOrder ? _self.totalOrder : totalOrder // ignore: cast_nullable_to_non_nullable
as int,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
