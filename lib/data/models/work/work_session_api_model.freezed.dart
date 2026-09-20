// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_session_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkSessionApiModel {

 int get id;@JsonKey(name: 'motorcycle_id') int get motorcycleId; Motorcycle get motorcycle; String get platform;@JsonKey(name: 'kilometers_start') int get kilometersStart;@JsonKey(name: 'goal_profit') int get goalProfit;@JsonKey(name: 'fuel_condition') String get fuelCondition;@JsonKey(name: 'kilometers_finish') int? get kilometersFinish;@JsonKey(name: 'total_expense') int get expense;@JsonKey(name: 'total_distance') int get distance;@JsonKey(name: 'total_fuel') int get fuelExpense;@JsonKey(name: 'total_income') int get income;@JsonKey(name: 'total_order') int get order;@JsonKey(name: 'status') String get status;@JsonKey(name: 'started_at') DateTime? get startedAt;@JsonKey(name: 'finished_at') DateTime? get finishedAt;
/// Create a copy of WorkSessionApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkSessionApiModelCopyWith<WorkSessionApiModel> get copyWith => _$WorkSessionApiModelCopyWithImpl<WorkSessionApiModel>(this as WorkSessionApiModel, _$identity);

  /// Serializes this WorkSessionApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkSessionApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.motorcycleId, motorcycleId) || other.motorcycleId == motorcycleId)&&(identical(other.motorcycle, motorcycle) || other.motorcycle == motorcycle)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.kilometersStart, kilometersStart) || other.kilometersStart == kilometersStart)&&(identical(other.goalProfit, goalProfit) || other.goalProfit == goalProfit)&&(identical(other.fuelCondition, fuelCondition) || other.fuelCondition == fuelCondition)&&(identical(other.kilometersFinish, kilometersFinish) || other.kilometersFinish == kilometersFinish)&&(identical(other.expense, expense) || other.expense == expense)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.income, income) || other.income == income)&&(identical(other.order, order) || other.order == order)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,motorcycleId,motorcycle,platform,kilometersStart,goalProfit,fuelCondition,kilometersFinish,expense,distance,fuelExpense,income,order,status,startedAt,finishedAt);

@override
String toString() {
  return 'WorkSessionApiModel(id: $id, motorcycleId: $motorcycleId, motorcycle: $motorcycle, platform: $platform, kilometersStart: $kilometersStart, goalProfit: $goalProfit, fuelCondition: $fuelCondition, kilometersFinish: $kilometersFinish, expense: $expense, distance: $distance, fuelExpense: $fuelExpense, income: $income, order: $order, status: $status, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class $WorkSessionApiModelCopyWith<$Res>  {
  factory $WorkSessionApiModelCopyWith(WorkSessionApiModel value, $Res Function(WorkSessionApiModel) _then) = _$WorkSessionApiModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'motorcycle_id') int motorcycleId, Motorcycle motorcycle, String platform,@JsonKey(name: 'kilometers_start') int kilometersStart,@JsonKey(name: 'goal_profit') int goalProfit,@JsonKey(name: 'fuel_condition') String fuelCondition,@JsonKey(name: 'kilometers_finish') int? kilometersFinish,@JsonKey(name: 'total_expense') int expense,@JsonKey(name: 'total_distance') int distance,@JsonKey(name: 'total_fuel') int fuelExpense,@JsonKey(name: 'total_income') int income,@JsonKey(name: 'total_order') int order,@JsonKey(name: 'status') String status,@JsonKey(name: 'started_at') DateTime? startedAt,@JsonKey(name: 'finished_at') DateTime? finishedAt
});


$MotorcycleCopyWith<$Res> get motorcycle;

}
/// @nodoc
class _$WorkSessionApiModelCopyWithImpl<$Res>
    implements $WorkSessionApiModelCopyWith<$Res> {
  _$WorkSessionApiModelCopyWithImpl(this._self, this._then);

  final WorkSessionApiModel _self;
  final $Res Function(WorkSessionApiModel) _then;

/// Create a copy of WorkSessionApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? motorcycleId = null,Object? motorcycle = null,Object? platform = null,Object? kilometersStart = null,Object? goalProfit = null,Object? fuelCondition = null,Object? kilometersFinish = freezed,Object? expense = null,Object? distance = null,Object? fuelExpense = null,Object? income = null,Object? order = null,Object? status = null,Object? startedAt = freezed,Object? finishedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,motorcycleId: null == motorcycleId ? _self.motorcycleId : motorcycleId // ignore: cast_nullable_to_non_nullable
as int,motorcycle: null == motorcycle ? _self.motorcycle : motorcycle // ignore: cast_nullable_to_non_nullable
as Motorcycle,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,kilometersStart: null == kilometersStart ? _self.kilometersStart : kilometersStart // ignore: cast_nullable_to_non_nullable
as int,goalProfit: null == goalProfit ? _self.goalProfit : goalProfit // ignore: cast_nullable_to_non_nullable
as int,fuelCondition: null == fuelCondition ? _self.fuelCondition : fuelCondition // ignore: cast_nullable_to_non_nullable
as String,kilometersFinish: freezed == kilometersFinish ? _self.kilometersFinish : kilometersFinish // ignore: cast_nullable_to_non_nullable
as int?,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as int,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of WorkSessionApiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MotorcycleCopyWith<$Res> get motorcycle {
  
  return $MotorcycleCopyWith<$Res>(_self.motorcycle, (value) {
    return _then(_self.copyWith(motorcycle: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkSessionApiModel].
extension WorkSessionApiModelPatterns on WorkSessionApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkSessionApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkSessionApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkSessionApiModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkSessionApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkSessionApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkSessionApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'motorcycle_id')  int motorcycleId,  Motorcycle motorcycle,  String platform, @JsonKey(name: 'kilometers_start')  int kilometersStart, @JsonKey(name: 'goal_profit')  int goalProfit, @JsonKey(name: 'fuel_condition')  String fuelCondition, @JsonKey(name: 'kilometers_finish')  int? kilometersFinish, @JsonKey(name: 'total_expense')  int expense, @JsonKey(name: 'total_distance')  int distance, @JsonKey(name: 'total_fuel')  int fuelExpense, @JsonKey(name: 'total_income')  int income, @JsonKey(name: 'total_order')  int order, @JsonKey(name: 'status')  String status, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'finished_at')  DateTime? finishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkSessionApiModel() when $default != null:
return $default(_that.id,_that.motorcycleId,_that.motorcycle,_that.platform,_that.kilometersStart,_that.goalProfit,_that.fuelCondition,_that.kilometersFinish,_that.expense,_that.distance,_that.fuelExpense,_that.income,_that.order,_that.status,_that.startedAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'motorcycle_id')  int motorcycleId,  Motorcycle motorcycle,  String platform, @JsonKey(name: 'kilometers_start')  int kilometersStart, @JsonKey(name: 'goal_profit')  int goalProfit, @JsonKey(name: 'fuel_condition')  String fuelCondition, @JsonKey(name: 'kilometers_finish')  int? kilometersFinish, @JsonKey(name: 'total_expense')  int expense, @JsonKey(name: 'total_distance')  int distance, @JsonKey(name: 'total_fuel')  int fuelExpense, @JsonKey(name: 'total_income')  int income, @JsonKey(name: 'total_order')  int order, @JsonKey(name: 'status')  String status, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'finished_at')  DateTime? finishedAt)  $default,) {final _that = this;
switch (_that) {
case _WorkSessionApiModel():
return $default(_that.id,_that.motorcycleId,_that.motorcycle,_that.platform,_that.kilometersStart,_that.goalProfit,_that.fuelCondition,_that.kilometersFinish,_that.expense,_that.distance,_that.fuelExpense,_that.income,_that.order,_that.status,_that.startedAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'motorcycle_id')  int motorcycleId,  Motorcycle motorcycle,  String platform, @JsonKey(name: 'kilometers_start')  int kilometersStart, @JsonKey(name: 'goal_profit')  int goalProfit, @JsonKey(name: 'fuel_condition')  String fuelCondition, @JsonKey(name: 'kilometers_finish')  int? kilometersFinish, @JsonKey(name: 'total_expense')  int expense, @JsonKey(name: 'total_distance')  int distance, @JsonKey(name: 'total_fuel')  int fuelExpense, @JsonKey(name: 'total_income')  int income, @JsonKey(name: 'total_order')  int order, @JsonKey(name: 'status')  String status, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'finished_at')  DateTime? finishedAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkSessionApiModel() when $default != null:
return $default(_that.id,_that.motorcycleId,_that.motorcycle,_that.platform,_that.kilometersStart,_that.goalProfit,_that.fuelCondition,_that.kilometersFinish,_that.expense,_that.distance,_that.fuelExpense,_that.income,_that.order,_that.status,_that.startedAt,_that.finishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkSessionApiModel implements WorkSessionApiModel {
  const _WorkSessionApiModel({required this.id, @JsonKey(name: 'motorcycle_id') required this.motorcycleId, required this.motorcycle, required this.platform, @JsonKey(name: 'kilometers_start') required this.kilometersStart, @JsonKey(name: 'goal_profit') required this.goalProfit, @JsonKey(name: 'fuel_condition') required this.fuelCondition, @JsonKey(name: 'kilometers_finish') this.kilometersFinish, @JsonKey(name: 'total_expense') this.expense = 0, @JsonKey(name: 'total_distance') this.distance = 0, @JsonKey(name: 'total_fuel') this.fuelExpense = 0, @JsonKey(name: 'total_income') this.income = 0, @JsonKey(name: 'total_order') this.order = 0, @JsonKey(name: 'status') this.status = 'ACTIVE', @JsonKey(name: 'started_at') this.startedAt, @JsonKey(name: 'finished_at') this.finishedAt});
  factory _WorkSessionApiModel.fromJson(Map<String, dynamic> json) => _$WorkSessionApiModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'motorcycle_id') final  int motorcycleId;
@override final  Motorcycle motorcycle;
@override final  String platform;
@override@JsonKey(name: 'kilometers_start') final  int kilometersStart;
@override@JsonKey(name: 'goal_profit') final  int goalProfit;
@override@JsonKey(name: 'fuel_condition') final  String fuelCondition;
@override@JsonKey(name: 'kilometers_finish') final  int? kilometersFinish;
@override@JsonKey(name: 'total_expense') final  int expense;
@override@JsonKey(name: 'total_distance') final  int distance;
@override@JsonKey(name: 'total_fuel') final  int fuelExpense;
@override@JsonKey(name: 'total_income') final  int income;
@override@JsonKey(name: 'total_order') final  int order;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'started_at') final  DateTime? startedAt;
@override@JsonKey(name: 'finished_at') final  DateTime? finishedAt;

/// Create a copy of WorkSessionApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkSessionApiModelCopyWith<_WorkSessionApiModel> get copyWith => __$WorkSessionApiModelCopyWithImpl<_WorkSessionApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkSessionApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkSessionApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.motorcycleId, motorcycleId) || other.motorcycleId == motorcycleId)&&(identical(other.motorcycle, motorcycle) || other.motorcycle == motorcycle)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.kilometersStart, kilometersStart) || other.kilometersStart == kilometersStart)&&(identical(other.goalProfit, goalProfit) || other.goalProfit == goalProfit)&&(identical(other.fuelCondition, fuelCondition) || other.fuelCondition == fuelCondition)&&(identical(other.kilometersFinish, kilometersFinish) || other.kilometersFinish == kilometersFinish)&&(identical(other.expense, expense) || other.expense == expense)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.income, income) || other.income == income)&&(identical(other.order, order) || other.order == order)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,motorcycleId,motorcycle,platform,kilometersStart,goalProfit,fuelCondition,kilometersFinish,expense,distance,fuelExpense,income,order,status,startedAt,finishedAt);

@override
String toString() {
  return 'WorkSessionApiModel(id: $id, motorcycleId: $motorcycleId, motorcycle: $motorcycle, platform: $platform, kilometersStart: $kilometersStart, goalProfit: $goalProfit, fuelCondition: $fuelCondition, kilometersFinish: $kilometersFinish, expense: $expense, distance: $distance, fuelExpense: $fuelExpense, income: $income, order: $order, status: $status, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class _$WorkSessionApiModelCopyWith<$Res> implements $WorkSessionApiModelCopyWith<$Res> {
  factory _$WorkSessionApiModelCopyWith(_WorkSessionApiModel value, $Res Function(_WorkSessionApiModel) _then) = __$WorkSessionApiModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'motorcycle_id') int motorcycleId, Motorcycle motorcycle, String platform,@JsonKey(name: 'kilometers_start') int kilometersStart,@JsonKey(name: 'goal_profit') int goalProfit,@JsonKey(name: 'fuel_condition') String fuelCondition,@JsonKey(name: 'kilometers_finish') int? kilometersFinish,@JsonKey(name: 'total_expense') int expense,@JsonKey(name: 'total_distance') int distance,@JsonKey(name: 'total_fuel') int fuelExpense,@JsonKey(name: 'total_income') int income,@JsonKey(name: 'total_order') int order,@JsonKey(name: 'status') String status,@JsonKey(name: 'started_at') DateTime? startedAt,@JsonKey(name: 'finished_at') DateTime? finishedAt
});


@override $MotorcycleCopyWith<$Res> get motorcycle;

}
/// @nodoc
class __$WorkSessionApiModelCopyWithImpl<$Res>
    implements _$WorkSessionApiModelCopyWith<$Res> {
  __$WorkSessionApiModelCopyWithImpl(this._self, this._then);

  final _WorkSessionApiModel _self;
  final $Res Function(_WorkSessionApiModel) _then;

/// Create a copy of WorkSessionApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? motorcycleId = null,Object? motorcycle = null,Object? platform = null,Object? kilometersStart = null,Object? goalProfit = null,Object? fuelCondition = null,Object? kilometersFinish = freezed,Object? expense = null,Object? distance = null,Object? fuelExpense = null,Object? income = null,Object? order = null,Object? status = null,Object? startedAt = freezed,Object? finishedAt = freezed,}) {
  return _then(_WorkSessionApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,motorcycleId: null == motorcycleId ? _self.motorcycleId : motorcycleId // ignore: cast_nullable_to_non_nullable
as int,motorcycle: null == motorcycle ? _self.motorcycle : motorcycle // ignore: cast_nullable_to_non_nullable
as Motorcycle,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,kilometersStart: null == kilometersStart ? _self.kilometersStart : kilometersStart // ignore: cast_nullable_to_non_nullable
as int,goalProfit: null == goalProfit ? _self.goalProfit : goalProfit // ignore: cast_nullable_to_non_nullable
as int,fuelCondition: null == fuelCondition ? _self.fuelCondition : fuelCondition // ignore: cast_nullable_to_non_nullable
as String,kilometersFinish: freezed == kilometersFinish ? _self.kilometersFinish : kilometersFinish // ignore: cast_nullable_to_non_nullable
as int?,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as int,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of WorkSessionApiModel
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
