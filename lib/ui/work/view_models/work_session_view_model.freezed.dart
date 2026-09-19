// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_session_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkSessionUiState {

 bool get isLoading; String? get errorMessage; WorkSession? get workSession; int get currentIncome; double get distance; Duration get duration; int get order;
/// Create a copy of WorkSessionUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkSessionUiStateCopyWith<WorkSessionUiState> get copyWith => _$WorkSessionUiStateCopyWithImpl<WorkSessionUiState>(this as WorkSessionUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkSessionUiState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.workSession, workSession) || other.workSession == workSession)&&(identical(other.currentIncome, currentIncome) || other.currentIncome == currentIncome)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,workSession,currentIncome,distance,duration,order);

@override
String toString() {
  return 'WorkSessionUiState(isLoading: $isLoading, errorMessage: $errorMessage, workSession: $workSession, currentIncome: $currentIncome, distance: $distance, duration: $duration, order: $order)';
}


}

/// @nodoc
abstract mixin class $WorkSessionUiStateCopyWith<$Res>  {
  factory $WorkSessionUiStateCopyWith(WorkSessionUiState value, $Res Function(WorkSessionUiState) _then) = _$WorkSessionUiStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? errorMessage, WorkSession? workSession, int currentIncome, double distance, Duration duration, int order
});


$WorkSessionCopyWith<$Res>? get workSession;

}
/// @nodoc
class _$WorkSessionUiStateCopyWithImpl<$Res>
    implements $WorkSessionUiStateCopyWith<$Res> {
  _$WorkSessionUiStateCopyWithImpl(this._self, this._then);

  final WorkSessionUiState _self;
  final $Res Function(WorkSessionUiState) _then;

/// Create a copy of WorkSessionUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? workSession = freezed,Object? currentIncome = null,Object? distance = null,Object? duration = null,Object? order = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,workSession: freezed == workSession ? _self.workSession : workSession // ignore: cast_nullable_to_non_nullable
as WorkSession?,currentIncome: null == currentIncome ? _self.currentIncome : currentIncome // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of WorkSessionUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkSessionCopyWith<$Res>? get workSession {
    if (_self.workSession == null) {
    return null;
  }

  return $WorkSessionCopyWith<$Res>(_self.workSession!, (value) {
    return _then(_self.copyWith(workSession: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkSessionUiState].
extension WorkSessionUiStatePatterns on WorkSessionUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkSessionUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkSessionUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkSessionUiState value)  $default,){
final _that = this;
switch (_that) {
case _WorkSessionUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkSessionUiState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkSessionUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  WorkSession? workSession,  int currentIncome,  double distance,  Duration duration,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkSessionUiState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.workSession,_that.currentIncome,_that.distance,_that.duration,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  WorkSession? workSession,  int currentIncome,  double distance,  Duration duration,  int order)  $default,) {final _that = this;
switch (_that) {
case _WorkSessionUiState():
return $default(_that.isLoading,_that.errorMessage,_that.workSession,_that.currentIncome,_that.distance,_that.duration,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? errorMessage,  WorkSession? workSession,  int currentIncome,  double distance,  Duration duration,  int order)?  $default,) {final _that = this;
switch (_that) {
case _WorkSessionUiState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.workSession,_that.currentIncome,_that.distance,_that.duration,_that.order);case _:
  return null;

}
}

}

/// @nodoc


class _WorkSessionUiState implements WorkSessionUiState {
  const _WorkSessionUiState({this.isLoading = false, this.errorMessage, this.workSession, this.currentIncome = 0, this.distance = 0, this.duration = Duration.zero, this.order = 0});
  

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override final  WorkSession? workSession;
@override@JsonKey() final  int currentIncome;
@override@JsonKey() final  double distance;
@override@JsonKey() final  Duration duration;
@override@JsonKey() final  int order;

/// Create a copy of WorkSessionUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkSessionUiStateCopyWith<_WorkSessionUiState> get copyWith => __$WorkSessionUiStateCopyWithImpl<_WorkSessionUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkSessionUiState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.workSession, workSession) || other.workSession == workSession)&&(identical(other.currentIncome, currentIncome) || other.currentIncome == currentIncome)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,workSession,currentIncome,distance,duration,order);

@override
String toString() {
  return 'WorkSessionUiState(isLoading: $isLoading, errorMessage: $errorMessage, workSession: $workSession, currentIncome: $currentIncome, distance: $distance, duration: $duration, order: $order)';
}


}

/// @nodoc
abstract mixin class _$WorkSessionUiStateCopyWith<$Res> implements $WorkSessionUiStateCopyWith<$Res> {
  factory _$WorkSessionUiStateCopyWith(_WorkSessionUiState value, $Res Function(_WorkSessionUiState) _then) = __$WorkSessionUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? errorMessage, WorkSession? workSession, int currentIncome, double distance, Duration duration, int order
});


@override $WorkSessionCopyWith<$Res>? get workSession;

}
/// @nodoc
class __$WorkSessionUiStateCopyWithImpl<$Res>
    implements _$WorkSessionUiStateCopyWith<$Res> {
  __$WorkSessionUiStateCopyWithImpl(this._self, this._then);

  final _WorkSessionUiState _self;
  final $Res Function(_WorkSessionUiState) _then;

/// Create a copy of WorkSessionUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? workSession = freezed,Object? currentIncome = null,Object? distance = null,Object? duration = null,Object? order = null,}) {
  return _then(_WorkSessionUiState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,workSession: freezed == workSession ? _self.workSession : workSession // ignore: cast_nullable_to_non_nullable
as WorkSession?,currentIncome: null == currentIncome ? _self.currentIncome : currentIncome // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of WorkSessionUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkSessionCopyWith<$Res>? get workSession {
    if (_self.workSession == null) {
    return null;
  }

  return $WorkSessionCopyWith<$Res>(_self.workSession!, (value) {
    return _then(_self.copyWith(workSession: value));
  });
}
}

// dart format on
