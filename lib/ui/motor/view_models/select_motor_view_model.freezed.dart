// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_motor_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectMotorUiState implements DiagnosticableTreeMixin {

 bool get isLoading; bool get isSelecting; List<Motorcycle> get motorcycles; Motorcycle? get selectedMotorcycle; String? get errorMessage;
/// Create a copy of SelectMotorUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectMotorUiStateCopyWith<SelectMotorUiState> get copyWith => _$SelectMotorUiStateCopyWithImpl<SelectMotorUiState>(this as SelectMotorUiState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SelectMotorUiState'))
    ..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('isSelecting', isSelecting))..add(DiagnosticsProperty('motorcycles', motorcycles))..add(DiagnosticsProperty('selectedMotorcycle', selectedMotorcycle))..add(DiagnosticsProperty('errorMessage', errorMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectMotorUiState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSelecting, isSelecting) || other.isSelecting == isSelecting)&&const DeepCollectionEquality().equals(other.motorcycles, motorcycles)&&(identical(other.selectedMotorcycle, selectedMotorcycle) || other.selectedMotorcycle == selectedMotorcycle)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSelecting,const DeepCollectionEquality().hash(motorcycles),selectedMotorcycle,errorMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SelectMotorUiState(isLoading: $isLoading, isSelecting: $isSelecting, motorcycles: $motorcycles, selectedMotorcycle: $selectedMotorcycle, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SelectMotorUiStateCopyWith<$Res>  {
  factory $SelectMotorUiStateCopyWith(SelectMotorUiState value, $Res Function(SelectMotorUiState) _then) = _$SelectMotorUiStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSelecting, List<Motorcycle> motorcycles, Motorcycle? selectedMotorcycle, String? errorMessage
});


$MotorcycleCopyWith<$Res>? get selectedMotorcycle;

}
/// @nodoc
class _$SelectMotorUiStateCopyWithImpl<$Res>
    implements $SelectMotorUiStateCopyWith<$Res> {
  _$SelectMotorUiStateCopyWithImpl(this._self, this._then);

  final SelectMotorUiState _self;
  final $Res Function(SelectMotorUiState) _then;

/// Create a copy of SelectMotorUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSelecting = null,Object? motorcycles = null,Object? selectedMotorcycle = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSelecting: null == isSelecting ? _self.isSelecting : isSelecting // ignore: cast_nullable_to_non_nullable
as bool,motorcycles: null == motorcycles ? _self.motorcycles : motorcycles // ignore: cast_nullable_to_non_nullable
as List<Motorcycle>,selectedMotorcycle: freezed == selectedMotorcycle ? _self.selectedMotorcycle : selectedMotorcycle // ignore: cast_nullable_to_non_nullable
as Motorcycle?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SelectMotorUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MotorcycleCopyWith<$Res>? get selectedMotorcycle {
    if (_self.selectedMotorcycle == null) {
    return null;
  }

  return $MotorcycleCopyWith<$Res>(_self.selectedMotorcycle!, (value) {
    return _then(_self.copyWith(selectedMotorcycle: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelectMotorUiState].
extension SelectMotorUiStatePatterns on SelectMotorUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectMotorUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectMotorUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectMotorUiState value)  $default,){
final _that = this;
switch (_that) {
case _SelectMotorUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectMotorUiState value)?  $default,){
final _that = this;
switch (_that) {
case _SelectMotorUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSelecting,  List<Motorcycle> motorcycles,  Motorcycle? selectedMotorcycle,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectMotorUiState() when $default != null:
return $default(_that.isLoading,_that.isSelecting,_that.motorcycles,_that.selectedMotorcycle,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSelecting,  List<Motorcycle> motorcycles,  Motorcycle? selectedMotorcycle,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SelectMotorUiState():
return $default(_that.isLoading,_that.isSelecting,_that.motorcycles,_that.selectedMotorcycle,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSelecting,  List<Motorcycle> motorcycles,  Motorcycle? selectedMotorcycle,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SelectMotorUiState() when $default != null:
return $default(_that.isLoading,_that.isSelecting,_that.motorcycles,_that.selectedMotorcycle,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SelectMotorUiState with DiagnosticableTreeMixin implements SelectMotorUiState {
  const _SelectMotorUiState({this.isLoading = false, this.isSelecting = false, final  List<Motorcycle> motorcycles = const [], this.selectedMotorcycle, this.errorMessage}): _motorcycles = motorcycles;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSelecting;
 final  List<Motorcycle> _motorcycles;
@override@JsonKey() List<Motorcycle> get motorcycles {
  if (_motorcycles is EqualUnmodifiableListView) return _motorcycles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_motorcycles);
}

@override final  Motorcycle? selectedMotorcycle;
@override final  String? errorMessage;

/// Create a copy of SelectMotorUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectMotorUiStateCopyWith<_SelectMotorUiState> get copyWith => __$SelectMotorUiStateCopyWithImpl<_SelectMotorUiState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SelectMotorUiState'))
    ..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('isSelecting', isSelecting))..add(DiagnosticsProperty('motorcycles', motorcycles))..add(DiagnosticsProperty('selectedMotorcycle', selectedMotorcycle))..add(DiagnosticsProperty('errorMessage', errorMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectMotorUiState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSelecting, isSelecting) || other.isSelecting == isSelecting)&&const DeepCollectionEquality().equals(other._motorcycles, _motorcycles)&&(identical(other.selectedMotorcycle, selectedMotorcycle) || other.selectedMotorcycle == selectedMotorcycle)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSelecting,const DeepCollectionEquality().hash(_motorcycles),selectedMotorcycle,errorMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SelectMotorUiState(isLoading: $isLoading, isSelecting: $isSelecting, motorcycles: $motorcycles, selectedMotorcycle: $selectedMotorcycle, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SelectMotorUiStateCopyWith<$Res> implements $SelectMotorUiStateCopyWith<$Res> {
  factory _$SelectMotorUiStateCopyWith(_SelectMotorUiState value, $Res Function(_SelectMotorUiState) _then) = __$SelectMotorUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSelecting, List<Motorcycle> motorcycles, Motorcycle? selectedMotorcycle, String? errorMessage
});


@override $MotorcycleCopyWith<$Res>? get selectedMotorcycle;

}
/// @nodoc
class __$SelectMotorUiStateCopyWithImpl<$Res>
    implements _$SelectMotorUiStateCopyWith<$Res> {
  __$SelectMotorUiStateCopyWithImpl(this._self, this._then);

  final _SelectMotorUiState _self;
  final $Res Function(_SelectMotorUiState) _then;

/// Create a copy of SelectMotorUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSelecting = null,Object? motorcycles = null,Object? selectedMotorcycle = freezed,Object? errorMessage = freezed,}) {
  return _then(_SelectMotorUiState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSelecting: null == isSelecting ? _self.isSelecting : isSelecting // ignore: cast_nullable_to_non_nullable
as bool,motorcycles: null == motorcycles ? _self._motorcycles : motorcycles // ignore: cast_nullable_to_non_nullable
as List<Motorcycle>,selectedMotorcycle: freezed == selectedMotorcycle ? _self.selectedMotorcycle : selectedMotorcycle // ignore: cast_nullable_to_non_nullable
as Motorcycle?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SelectMotorUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MotorcycleCopyWith<$Res>? get selectedMotorcycle {
    if (_self.selectedMotorcycle == null) {
    return null;
  }

  return $MotorcycleCopyWith<$Res>(_self.selectedMotorcycle!, (value) {
    return _then(_self.copyWith(selectedMotorcycle: value));
  });
}
}

// dart format on
