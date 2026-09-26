// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_work_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StartWorkUiState implements DiagnosticableTreeMixin {

 PlatformData get selectedPlatform; double get fuelLevel; int get targetProfit; bool get isStarting; Motorcycle? get motorcycle; WorkSession? get workSession; String? get errorMessage;
/// Create a copy of StartWorkUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartWorkUiStateCopyWith<StartWorkUiState> get copyWith => _$StartWorkUiStateCopyWithImpl<StartWorkUiState>(this as StartWorkUiState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StartWorkUiState'))
    ..add(DiagnosticsProperty('selectedPlatform', selectedPlatform))..add(DiagnosticsProperty('fuelLevel', fuelLevel))..add(DiagnosticsProperty('targetProfit', targetProfit))..add(DiagnosticsProperty('isStarting', isStarting))..add(DiagnosticsProperty('motorcycle', motorcycle))..add(DiagnosticsProperty('workSession', workSession))..add(DiagnosticsProperty('errorMessage', errorMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartWorkUiState&&(identical(other.selectedPlatform, selectedPlatform) || other.selectedPlatform == selectedPlatform)&&(identical(other.fuelLevel, fuelLevel) || other.fuelLevel == fuelLevel)&&(identical(other.targetProfit, targetProfit) || other.targetProfit == targetProfit)&&(identical(other.isStarting, isStarting) || other.isStarting == isStarting)&&(identical(other.motorcycle, motorcycle) || other.motorcycle == motorcycle)&&(identical(other.workSession, workSession) || other.workSession == workSession)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedPlatform,fuelLevel,targetProfit,isStarting,motorcycle,workSession,errorMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StartWorkUiState(selectedPlatform: $selectedPlatform, fuelLevel: $fuelLevel, targetProfit: $targetProfit, isStarting: $isStarting, motorcycle: $motorcycle, workSession: $workSession, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $StartWorkUiStateCopyWith<$Res>  {
  factory $StartWorkUiStateCopyWith(StartWorkUiState value, $Res Function(StartWorkUiState) _then) = _$StartWorkUiStateCopyWithImpl;
@useResult
$Res call({
 PlatformData selectedPlatform, double fuelLevel, int targetProfit, bool isStarting, Motorcycle? motorcycle, WorkSession? workSession, String? errorMessage
});


$MotorcycleCopyWith<$Res>? get motorcycle;$WorkSessionCopyWith<$Res>? get workSession;

}
/// @nodoc
class _$StartWorkUiStateCopyWithImpl<$Res>
    implements $StartWorkUiStateCopyWith<$Res> {
  _$StartWorkUiStateCopyWithImpl(this._self, this._then);

  final StartWorkUiState _self;
  final $Res Function(StartWorkUiState) _then;

/// Create a copy of StartWorkUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedPlatform = null,Object? fuelLevel = null,Object? targetProfit = null,Object? isStarting = null,Object? motorcycle = freezed,Object? workSession = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
selectedPlatform: null == selectedPlatform ? _self.selectedPlatform : selectedPlatform // ignore: cast_nullable_to_non_nullable
as PlatformData,fuelLevel: null == fuelLevel ? _self.fuelLevel : fuelLevel // ignore: cast_nullable_to_non_nullable
as double,targetProfit: null == targetProfit ? _self.targetProfit : targetProfit // ignore: cast_nullable_to_non_nullable
as int,isStarting: null == isStarting ? _self.isStarting : isStarting // ignore: cast_nullable_to_non_nullable
as bool,motorcycle: freezed == motorcycle ? _self.motorcycle : motorcycle // ignore: cast_nullable_to_non_nullable
as Motorcycle?,workSession: freezed == workSession ? _self.workSession : workSession // ignore: cast_nullable_to_non_nullable
as WorkSession?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of StartWorkUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MotorcycleCopyWith<$Res>? get motorcycle {
    if (_self.motorcycle == null) {
    return null;
  }

  return $MotorcycleCopyWith<$Res>(_self.motorcycle!, (value) {
    return _then(_self.copyWith(motorcycle: value));
  });
}/// Create a copy of StartWorkUiState
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


/// Adds pattern-matching-related methods to [StartWorkUiState].
extension StartWorkUiStatePatterns on StartWorkUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartWorkUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartWorkUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartWorkUiState value)  $default,){
final _that = this;
switch (_that) {
case _StartWorkUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartWorkUiState value)?  $default,){
final _that = this;
switch (_that) {
case _StartWorkUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlatformData selectedPlatform,  double fuelLevel,  int targetProfit,  bool isStarting,  Motorcycle? motorcycle,  WorkSession? workSession,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartWorkUiState() when $default != null:
return $default(_that.selectedPlatform,_that.fuelLevel,_that.targetProfit,_that.isStarting,_that.motorcycle,_that.workSession,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlatformData selectedPlatform,  double fuelLevel,  int targetProfit,  bool isStarting,  Motorcycle? motorcycle,  WorkSession? workSession,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _StartWorkUiState():
return $default(_that.selectedPlatform,_that.fuelLevel,_that.targetProfit,_that.isStarting,_that.motorcycle,_that.workSession,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlatformData selectedPlatform,  double fuelLevel,  int targetProfit,  bool isStarting,  Motorcycle? motorcycle,  WorkSession? workSession,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _StartWorkUiState() when $default != null:
return $default(_that.selectedPlatform,_that.fuelLevel,_that.targetProfit,_that.isStarting,_that.motorcycle,_that.workSession,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _StartWorkUiState with DiagnosticableTreeMixin implements StartWorkUiState {
  const _StartWorkUiState({this.selectedPlatform = const PlatformData(name: 'Grab', subtitle: 'Transport & delivery', icon: Icons.two_wheeler_rounded, color: Color(0xFF08A94F)), this.fuelLevel = 0, this.targetProfit = 0, this.isStarting = false, this.motorcycle, this.workSession, this.errorMessage});
  

@override@JsonKey() final  PlatformData selectedPlatform;
@override@JsonKey() final  double fuelLevel;
@override@JsonKey() final  int targetProfit;
@override@JsonKey() final  bool isStarting;
@override final  Motorcycle? motorcycle;
@override final  WorkSession? workSession;
@override final  String? errorMessage;

/// Create a copy of StartWorkUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartWorkUiStateCopyWith<_StartWorkUiState> get copyWith => __$StartWorkUiStateCopyWithImpl<_StartWorkUiState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StartWorkUiState'))
    ..add(DiagnosticsProperty('selectedPlatform', selectedPlatform))..add(DiagnosticsProperty('fuelLevel', fuelLevel))..add(DiagnosticsProperty('targetProfit', targetProfit))..add(DiagnosticsProperty('isStarting', isStarting))..add(DiagnosticsProperty('motorcycle', motorcycle))..add(DiagnosticsProperty('workSession', workSession))..add(DiagnosticsProperty('errorMessage', errorMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartWorkUiState&&(identical(other.selectedPlatform, selectedPlatform) || other.selectedPlatform == selectedPlatform)&&(identical(other.fuelLevel, fuelLevel) || other.fuelLevel == fuelLevel)&&(identical(other.targetProfit, targetProfit) || other.targetProfit == targetProfit)&&(identical(other.isStarting, isStarting) || other.isStarting == isStarting)&&(identical(other.motorcycle, motorcycle) || other.motorcycle == motorcycle)&&(identical(other.workSession, workSession) || other.workSession == workSession)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedPlatform,fuelLevel,targetProfit,isStarting,motorcycle,workSession,errorMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StartWorkUiState(selectedPlatform: $selectedPlatform, fuelLevel: $fuelLevel, targetProfit: $targetProfit, isStarting: $isStarting, motorcycle: $motorcycle, workSession: $workSession, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$StartWorkUiStateCopyWith<$Res> implements $StartWorkUiStateCopyWith<$Res> {
  factory _$StartWorkUiStateCopyWith(_StartWorkUiState value, $Res Function(_StartWorkUiState) _then) = __$StartWorkUiStateCopyWithImpl;
@override @useResult
$Res call({
 PlatformData selectedPlatform, double fuelLevel, int targetProfit, bool isStarting, Motorcycle? motorcycle, WorkSession? workSession, String? errorMessage
});


@override $MotorcycleCopyWith<$Res>? get motorcycle;@override $WorkSessionCopyWith<$Res>? get workSession;

}
/// @nodoc
class __$StartWorkUiStateCopyWithImpl<$Res>
    implements _$StartWorkUiStateCopyWith<$Res> {
  __$StartWorkUiStateCopyWithImpl(this._self, this._then);

  final _StartWorkUiState _self;
  final $Res Function(_StartWorkUiState) _then;

/// Create a copy of StartWorkUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedPlatform = null,Object? fuelLevel = null,Object? targetProfit = null,Object? isStarting = null,Object? motorcycle = freezed,Object? workSession = freezed,Object? errorMessage = freezed,}) {
  return _then(_StartWorkUiState(
selectedPlatform: null == selectedPlatform ? _self.selectedPlatform : selectedPlatform // ignore: cast_nullable_to_non_nullable
as PlatformData,fuelLevel: null == fuelLevel ? _self.fuelLevel : fuelLevel // ignore: cast_nullable_to_non_nullable
as double,targetProfit: null == targetProfit ? _self.targetProfit : targetProfit // ignore: cast_nullable_to_non_nullable
as int,isStarting: null == isStarting ? _self.isStarting : isStarting // ignore: cast_nullable_to_non_nullable
as bool,motorcycle: freezed == motorcycle ? _self.motorcycle : motorcycle // ignore: cast_nullable_to_non_nullable
as Motorcycle?,workSession: freezed == workSession ? _self.workSession : workSession // ignore: cast_nullable_to_non_nullable
as WorkSession?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of StartWorkUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MotorcycleCopyWith<$Res>? get motorcycle {
    if (_self.motorcycle == null) {
    return null;
  }

  return $MotorcycleCopyWith<$Res>(_self.motorcycle!, (value) {
    return _then(_self.copyWith(motorcycle: value));
  });
}/// Create a copy of StartWorkUiState
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
