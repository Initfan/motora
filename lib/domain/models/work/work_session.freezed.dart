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

 int get id; int get motorcycleId; String get platform; int get kilometersStart; int get goalProfit; String get fuelCondition; int? get kilometersFinish; String get status; int get fuelExpense; int get expense; int get distance; int get income; int get order; Motorcycle get motorcycle; DateTime? get startedAt; DateTime? get finishedAt;
/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkSessionCopyWith<WorkSession> get copyWith => _$WorkSessionCopyWithImpl<WorkSession>(this as WorkSession, _$identity);

  /// Serializes this WorkSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkSession&&(identical(other.id, id) || other.id == id)&&(identical(other.motorcycleId, motorcycleId) || other.motorcycleId == motorcycleId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.kilometersStart, kilometersStart) || other.kilometersStart == kilometersStart)&&(identical(other.goalProfit, goalProfit) || other.goalProfit == goalProfit)&&(identical(other.fuelCondition, fuelCondition) || other.fuelCondition == fuelCondition)&&(identical(other.kilometersFinish, kilometersFinish) || other.kilometersFinish == kilometersFinish)&&(identical(other.status, status) || other.status == status)&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.expense, expense) || other.expense == expense)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.income, income) || other.income == income)&&(identical(other.order, order) || other.order == order)&&(identical(other.motorcycle, motorcycle) || other.motorcycle == motorcycle)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,motorcycleId,platform,kilometersStart,goalProfit,fuelCondition,kilometersFinish,status,fuelExpense,expense,distance,income,order,motorcycle,startedAt,finishedAt);

@override
String toString() {
  return 'WorkSession(id: $id, motorcycleId: $motorcycleId, platform: $platform, kilometersStart: $kilometersStart, goalProfit: $goalProfit, fuelCondition: $fuelCondition, kilometersFinish: $kilometersFinish, status: $status, fuelExpense: $fuelExpense, expense: $expense, distance: $distance, income: $income, order: $order, motorcycle: $motorcycle, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class $WorkSessionCopyWith<$Res>  {
  factory $WorkSessionCopyWith(WorkSession value, $Res Function(WorkSession) _then) = _$WorkSessionCopyWithImpl;
@useResult
$Res call({
 int id, int motorcycleId, String platform, int kilometersStart, int goalProfit, String fuelCondition, int? kilometersFinish, String status, int fuelExpense, int expense, int distance, int income, int order, Motorcycle motorcycle, DateTime? startedAt, DateTime? finishedAt
});


$MotorcycleCopyWith<$Res> get motorcycle;

}
/// @nodoc
class _$WorkSessionCopyWithImpl<$Res>
    implements $WorkSessionCopyWith<$Res> {
  _$WorkSessionCopyWithImpl(this._self, this._then);

  final WorkSession _self;
  final $Res Function(WorkSession) _then;

/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? motorcycleId = null,Object? platform = null,Object? kilometersStart = null,Object? goalProfit = null,Object? fuelCondition = null,Object? kilometersFinish = freezed,Object? status = null,Object? fuelExpense = null,Object? expense = null,Object? distance = null,Object? income = null,Object? order = null,Object? motorcycle = null,Object? startedAt = freezed,Object? finishedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,motorcycleId: null == motorcycleId ? _self.motorcycleId : motorcycleId // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,kilometersStart: null == kilometersStart ? _self.kilometersStart : kilometersStart // ignore: cast_nullable_to_non_nullable
as int,goalProfit: null == goalProfit ? _self.goalProfit : goalProfit // ignore: cast_nullable_to_non_nullable
as int,fuelCondition: null == fuelCondition ? _self.fuelCondition : fuelCondition // ignore: cast_nullable_to_non_nullable
as String,kilometersFinish: freezed == kilometersFinish ? _self.kilometersFinish : kilometersFinish // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as int,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,motorcycle: null == motorcycle ? _self.motorcycle : motorcycle // ignore: cast_nullable_to_non_nullable
as Motorcycle,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MotorcycleCopyWith<$Res> get motorcycle {
  
  return $MotorcycleCopyWith<$Res>(_self.motorcycle, (value) {
    return _then(_self.copyWith(motorcycle: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int motorcycleId,  String platform,  int kilometersStart,  int goalProfit,  String fuelCondition,  int? kilometersFinish,  String status,  int fuelExpense,  int expense,  int distance,  int income,  int order,  Motorcycle motorcycle,  DateTime? startedAt,  DateTime? finishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkSession() when $default != null:
return $default(_that.id,_that.motorcycleId,_that.platform,_that.kilometersStart,_that.goalProfit,_that.fuelCondition,_that.kilometersFinish,_that.status,_that.fuelExpense,_that.expense,_that.distance,_that.income,_that.order,_that.motorcycle,_that.startedAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int motorcycleId,  String platform,  int kilometersStart,  int goalProfit,  String fuelCondition,  int? kilometersFinish,  String status,  int fuelExpense,  int expense,  int distance,  int income,  int order,  Motorcycle motorcycle,  DateTime? startedAt,  DateTime? finishedAt)  $default,) {final _that = this;
switch (_that) {
case _WorkSession():
return $default(_that.id,_that.motorcycleId,_that.platform,_that.kilometersStart,_that.goalProfit,_that.fuelCondition,_that.kilometersFinish,_that.status,_that.fuelExpense,_that.expense,_that.distance,_that.income,_that.order,_that.motorcycle,_that.startedAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int motorcycleId,  String platform,  int kilometersStart,  int goalProfit,  String fuelCondition,  int? kilometersFinish,  String status,  int fuelExpense,  int expense,  int distance,  int income,  int order,  Motorcycle motorcycle,  DateTime? startedAt,  DateTime? finishedAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkSession() when $default != null:
return $default(_that.id,_that.motorcycleId,_that.platform,_that.kilometersStart,_that.goalProfit,_that.fuelCondition,_that.kilometersFinish,_that.status,_that.fuelExpense,_that.expense,_that.distance,_that.income,_that.order,_that.motorcycle,_that.startedAt,_that.finishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkSession implements WorkSession {
  const _WorkSession({required this.id, required this.motorcycleId, required this.platform, required this.kilometersStart, required this.goalProfit, required this.fuelCondition, this.kilometersFinish, this.status = "ACTIVE", this.fuelExpense = 0, this.expense = 0, this.distance = 0, this.income = 0, this.order = 0, required this.motorcycle, this.startedAt, this.finishedAt});
  factory _WorkSession.fromJson(Map<String, dynamic> json) => _$WorkSessionFromJson(json);

@override final  int id;
@override final  int motorcycleId;
@override final  String platform;
@override final  int kilometersStart;
@override final  int goalProfit;
@override final  String fuelCondition;
@override final  int? kilometersFinish;
@override@JsonKey() final  String status;
@override@JsonKey() final  int fuelExpense;
@override@JsonKey() final  int expense;
@override@JsonKey() final  int distance;
@override@JsonKey() final  int income;
@override@JsonKey() final  int order;
@override final  Motorcycle motorcycle;
@override final  DateTime? startedAt;
@override final  DateTime? finishedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkSession&&(identical(other.id, id) || other.id == id)&&(identical(other.motorcycleId, motorcycleId) || other.motorcycleId == motorcycleId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.kilometersStart, kilometersStart) || other.kilometersStart == kilometersStart)&&(identical(other.goalProfit, goalProfit) || other.goalProfit == goalProfit)&&(identical(other.fuelCondition, fuelCondition) || other.fuelCondition == fuelCondition)&&(identical(other.kilometersFinish, kilometersFinish) || other.kilometersFinish == kilometersFinish)&&(identical(other.status, status) || other.status == status)&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.expense, expense) || other.expense == expense)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.income, income) || other.income == income)&&(identical(other.order, order) || other.order == order)&&(identical(other.motorcycle, motorcycle) || other.motorcycle == motorcycle)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,motorcycleId,platform,kilometersStart,goalProfit,fuelCondition,kilometersFinish,status,fuelExpense,expense,distance,income,order,motorcycle,startedAt,finishedAt);

@override
String toString() {
  return 'WorkSession(id: $id, motorcycleId: $motorcycleId, platform: $platform, kilometersStart: $kilometersStart, goalProfit: $goalProfit, fuelCondition: $fuelCondition, kilometersFinish: $kilometersFinish, status: $status, fuelExpense: $fuelExpense, expense: $expense, distance: $distance, income: $income, order: $order, motorcycle: $motorcycle, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class _$WorkSessionCopyWith<$Res> implements $WorkSessionCopyWith<$Res> {
  factory _$WorkSessionCopyWith(_WorkSession value, $Res Function(_WorkSession) _then) = __$WorkSessionCopyWithImpl;
@override @useResult
$Res call({
 int id, int motorcycleId, String platform, int kilometersStart, int goalProfit, String fuelCondition, int? kilometersFinish, String status, int fuelExpense, int expense, int distance, int income, int order, Motorcycle motorcycle, DateTime? startedAt, DateTime? finishedAt
});


@override $MotorcycleCopyWith<$Res> get motorcycle;

}
/// @nodoc
class __$WorkSessionCopyWithImpl<$Res>
    implements _$WorkSessionCopyWith<$Res> {
  __$WorkSessionCopyWithImpl(this._self, this._then);

  final _WorkSession _self;
  final $Res Function(_WorkSession) _then;

/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? motorcycleId = null,Object? platform = null,Object? kilometersStart = null,Object? goalProfit = null,Object? fuelCondition = null,Object? kilometersFinish = freezed,Object? status = null,Object? fuelExpense = null,Object? expense = null,Object? distance = null,Object? income = null,Object? order = null,Object? motorcycle = null,Object? startedAt = freezed,Object? finishedAt = freezed,}) {
  return _then(_WorkSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,motorcycleId: null == motorcycleId ? _self.motorcycleId : motorcycleId // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,kilometersStart: null == kilometersStart ? _self.kilometersStart : kilometersStart // ignore: cast_nullable_to_non_nullable
as int,goalProfit: null == goalProfit ? _self.goalProfit : goalProfit // ignore: cast_nullable_to_non_nullable
as int,fuelCondition: null == fuelCondition ? _self.fuelCondition : fuelCondition // ignore: cast_nullable_to_non_nullable
as String,kilometersFinish: freezed == kilometersFinish ? _self.kilometersFinish : kilometersFinish // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as int,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,motorcycle: null == motorcycle ? _self.motorcycle : motorcycle // ignore: cast_nullable_to_non_nullable
as Motorcycle,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MotorcycleCopyWith<$Res> get motorcycle {
  
  return $MotorcycleCopyWith<$Res>(_self.motorcycle, (value) {
    return _then(_self.copyWith(motorcycle: value));
  });
}
}

// dart format on
