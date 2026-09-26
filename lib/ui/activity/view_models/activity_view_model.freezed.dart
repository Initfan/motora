// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityViewUiState {

 List<String> get filters; WeekRange? get selectedFilter; bool get isLoading; List<Activity>? get activities; int get totalActivities; int get totalIncome; int get totalOrder; Duration get totalDuration; double get totalDistance;
/// Create a copy of ActivityViewUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityViewUiStateCopyWith<ActivityViewUiState> get copyWith => _$ActivityViewUiStateCopyWithImpl<ActivityViewUiState>(this as ActivityViewUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityViewUiState&&const DeepCollectionEquality().equals(other.filters, filters)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.activities, activities)&&(identical(other.totalActivities, totalActivities) || other.totalActivities == totalActivities)&&(identical(other.totalIncome, totalIncome) || other.totalIncome == totalIncome)&&(identical(other.totalOrder, totalOrder) || other.totalOrder == totalOrder)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalDistance, totalDistance) || other.totalDistance == totalDistance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(filters),selectedFilter,isLoading,const DeepCollectionEquality().hash(activities),totalActivities,totalIncome,totalOrder,totalDuration,totalDistance);

@override
String toString() {
  return 'ActivityViewUiState(filters: $filters, selectedFilter: $selectedFilter, isLoading: $isLoading, activities: $activities, totalActivities: $totalActivities, totalIncome: $totalIncome, totalOrder: $totalOrder, totalDuration: $totalDuration, totalDistance: $totalDistance)';
}


}

/// @nodoc
abstract mixin class $ActivityViewUiStateCopyWith<$Res>  {
  factory $ActivityViewUiStateCopyWith(ActivityViewUiState value, $Res Function(ActivityViewUiState) _then) = _$ActivityViewUiStateCopyWithImpl;
@useResult
$Res call({
 List<String> filters, WeekRange? selectedFilter, bool isLoading, List<Activity>? activities, int totalActivities, int totalIncome, int totalOrder, Duration totalDuration, double totalDistance
});




}
/// @nodoc
class _$ActivityViewUiStateCopyWithImpl<$Res>
    implements $ActivityViewUiStateCopyWith<$Res> {
  _$ActivityViewUiStateCopyWithImpl(this._self, this._then);

  final ActivityViewUiState _self;
  final $Res Function(ActivityViewUiState) _then;

/// Create a copy of ActivityViewUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filters = null,Object? selectedFilter = freezed,Object? isLoading = null,Object? activities = freezed,Object? totalActivities = null,Object? totalIncome = null,Object? totalOrder = null,Object? totalDuration = null,Object? totalDistance = null,}) {
  return _then(_self.copyWith(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<String>,selectedFilter: freezed == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as WeekRange?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,activities: freezed == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as List<Activity>?,totalActivities: null == totalActivities ? _self.totalActivities : totalActivities // ignore: cast_nullable_to_non_nullable
as int,totalIncome: null == totalIncome ? _self.totalIncome : totalIncome // ignore: cast_nullable_to_non_nullable
as int,totalOrder: null == totalOrder ? _self.totalOrder : totalOrder // ignore: cast_nullable_to_non_nullable
as int,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,totalDistance: null == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityViewUiState].
extension ActivityViewUiStatePatterns on ActivityViewUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityViewUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityViewUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityViewUiState value)  $default,){
final _that = this;
switch (_that) {
case _ActivityViewUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityViewUiState value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityViewUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> filters,  WeekRange? selectedFilter,  bool isLoading,  List<Activity>? activities,  int totalActivities,  int totalIncome,  int totalOrder,  Duration totalDuration,  double totalDistance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityViewUiState() when $default != null:
return $default(_that.filters,_that.selectedFilter,_that.isLoading,_that.activities,_that.totalActivities,_that.totalIncome,_that.totalOrder,_that.totalDuration,_that.totalDistance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> filters,  WeekRange? selectedFilter,  bool isLoading,  List<Activity>? activities,  int totalActivities,  int totalIncome,  int totalOrder,  Duration totalDuration,  double totalDistance)  $default,) {final _that = this;
switch (_that) {
case _ActivityViewUiState():
return $default(_that.filters,_that.selectedFilter,_that.isLoading,_that.activities,_that.totalActivities,_that.totalIncome,_that.totalOrder,_that.totalDuration,_that.totalDistance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> filters,  WeekRange? selectedFilter,  bool isLoading,  List<Activity>? activities,  int totalActivities,  int totalIncome,  int totalOrder,  Duration totalDuration,  double totalDistance)?  $default,) {final _that = this;
switch (_that) {
case _ActivityViewUiState() when $default != null:
return $default(_that.filters,_that.selectedFilter,_that.isLoading,_that.activities,_that.totalActivities,_that.totalIncome,_that.totalOrder,_that.totalDuration,_that.totalDistance);case _:
  return null;

}
}

}

/// @nodoc


class _ActivityViewUiState implements ActivityViewUiState {
  const _ActivityViewUiState({final  List<String> filters = const ['Semua', 'Selesai', 'Berjalan', 'Dibatalkan'], this.selectedFilter, this.isLoading = true, final  List<Activity>? activities, this.totalActivities = 0, this.totalIncome = 0, this.totalOrder = 0, this.totalDuration = Duration.zero, this.totalDistance = 0}): _filters = filters,_activities = activities;
  

 final  List<String> _filters;
@override@JsonKey() List<String> get filters {
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filters);
}

@override final  WeekRange? selectedFilter;
@override@JsonKey() final  bool isLoading;
 final  List<Activity>? _activities;
@override List<Activity>? get activities {
  final value = _activities;
  if (value == null) return null;
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  int totalActivities;
@override@JsonKey() final  int totalIncome;
@override@JsonKey() final  int totalOrder;
@override@JsonKey() final  Duration totalDuration;
@override@JsonKey() final  double totalDistance;

/// Create a copy of ActivityViewUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityViewUiStateCopyWith<_ActivityViewUiState> get copyWith => __$ActivityViewUiStateCopyWithImpl<_ActivityViewUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityViewUiState&&const DeepCollectionEquality().equals(other._filters, _filters)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._activities, _activities)&&(identical(other.totalActivities, totalActivities) || other.totalActivities == totalActivities)&&(identical(other.totalIncome, totalIncome) || other.totalIncome == totalIncome)&&(identical(other.totalOrder, totalOrder) || other.totalOrder == totalOrder)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalDistance, totalDistance) || other.totalDistance == totalDistance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_filters),selectedFilter,isLoading,const DeepCollectionEquality().hash(_activities),totalActivities,totalIncome,totalOrder,totalDuration,totalDistance);

@override
String toString() {
  return 'ActivityViewUiState(filters: $filters, selectedFilter: $selectedFilter, isLoading: $isLoading, activities: $activities, totalActivities: $totalActivities, totalIncome: $totalIncome, totalOrder: $totalOrder, totalDuration: $totalDuration, totalDistance: $totalDistance)';
}


}

/// @nodoc
abstract mixin class _$ActivityViewUiStateCopyWith<$Res> implements $ActivityViewUiStateCopyWith<$Res> {
  factory _$ActivityViewUiStateCopyWith(_ActivityViewUiState value, $Res Function(_ActivityViewUiState) _then) = __$ActivityViewUiStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> filters, WeekRange? selectedFilter, bool isLoading, List<Activity>? activities, int totalActivities, int totalIncome, int totalOrder, Duration totalDuration, double totalDistance
});




}
/// @nodoc
class __$ActivityViewUiStateCopyWithImpl<$Res>
    implements _$ActivityViewUiStateCopyWith<$Res> {
  __$ActivityViewUiStateCopyWithImpl(this._self, this._then);

  final _ActivityViewUiState _self;
  final $Res Function(_ActivityViewUiState) _then;

/// Create a copy of ActivityViewUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filters = null,Object? selectedFilter = freezed,Object? isLoading = null,Object? activities = freezed,Object? totalActivities = null,Object? totalIncome = null,Object? totalOrder = null,Object? totalDuration = null,Object? totalDistance = null,}) {
  return _then(_ActivityViewUiState(
filters: null == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as List<String>,selectedFilter: freezed == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as WeekRange?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,activities: freezed == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<Activity>?,totalActivities: null == totalActivities ? _self.totalActivities : totalActivities // ignore: cast_nullable_to_non_nullable
as int,totalIncome: null == totalIncome ? _self.totalIncome : totalIncome // ignore: cast_nullable_to_non_nullable
as int,totalOrder: null == totalOrder ? _self.totalOrder : totalOrder // ignore: cast_nullable_to_non_nullable
as int,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,totalDistance: null == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
