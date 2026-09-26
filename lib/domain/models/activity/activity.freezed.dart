// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Activity {

 DateTime get date; String get time; String get platform; String get status; int get orders; Duration get duration; int get income; int get distance; IconData get icon; Color get iconColor; Color get iconBackground;
/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityCopyWith<Activity> get copyWith => _$ActivityCopyWithImpl<Activity>(this as Activity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Activity&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.status, status) || other.status == status)&&(identical(other.orders, orders) || other.orders == orders)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.income, income) || other.income == income)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.iconBackground, iconBackground) || other.iconBackground == iconBackground));
}


@override
int get hashCode => Object.hash(runtimeType,date,time,platform,status,orders,duration,income,distance,icon,iconColor,iconBackground);

@override
String toString() {
  return 'Activity(date: $date, time: $time, platform: $platform, status: $status, orders: $orders, duration: $duration, income: $income, distance: $distance, icon: $icon, iconColor: $iconColor, iconBackground: $iconBackground)';
}


}

/// @nodoc
abstract mixin class $ActivityCopyWith<$Res>  {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) _then) = _$ActivityCopyWithImpl;
@useResult
$Res call({
 DateTime date, String time, String platform, String status, int orders, Duration duration, int income, int distance, IconData icon, Color iconColor, Color iconBackground
});




}
/// @nodoc
class _$ActivityCopyWithImpl<$Res>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._self, this._then);

  final Activity _self;
  final $Res Function(Activity) _then;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? time = null,Object? platform = null,Object? status = null,Object? orders = null,Object? duration = null,Object? income = null,Object? distance = null,Object? icon = null,Object? iconColor = null,Object? iconBackground = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as Color,iconBackground: null == iconBackground ? _self.iconBackground : iconBackground // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [Activity].
extension ActivityPatterns on Activity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Activity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Activity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Activity value)  $default,){
final _that = this;
switch (_that) {
case _Activity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Activity value)?  $default,){
final _that = this;
switch (_that) {
case _Activity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  String time,  String platform,  String status,  int orders,  Duration duration,  int income,  int distance,  IconData icon,  Color iconColor,  Color iconBackground)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Activity() when $default != null:
return $default(_that.date,_that.time,_that.platform,_that.status,_that.orders,_that.duration,_that.income,_that.distance,_that.icon,_that.iconColor,_that.iconBackground);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  String time,  String platform,  String status,  int orders,  Duration duration,  int income,  int distance,  IconData icon,  Color iconColor,  Color iconBackground)  $default,) {final _that = this;
switch (_that) {
case _Activity():
return $default(_that.date,_that.time,_that.platform,_that.status,_that.orders,_that.duration,_that.income,_that.distance,_that.icon,_that.iconColor,_that.iconBackground);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  String time,  String platform,  String status,  int orders,  Duration duration,  int income,  int distance,  IconData icon,  Color iconColor,  Color iconBackground)?  $default,) {final _that = this;
switch (_that) {
case _Activity() when $default != null:
return $default(_that.date,_that.time,_that.platform,_that.status,_that.orders,_that.duration,_that.income,_that.distance,_that.icon,_that.iconColor,_that.iconBackground);case _:
  return null;

}
}

}

/// @nodoc


class _Activity implements Activity {
  const _Activity({required this.date, required this.time, required this.platform, required this.status, required this.orders, required this.duration, required this.income, required this.distance, required this.icon, required this.iconColor, required this.iconBackground});
  

@override final  DateTime date;
@override final  String time;
@override final  String platform;
@override final  String status;
@override final  int orders;
@override final  Duration duration;
@override final  int income;
@override final  int distance;
@override final  IconData icon;
@override final  Color iconColor;
@override final  Color iconBackground;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityCopyWith<_Activity> get copyWith => __$ActivityCopyWithImpl<_Activity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Activity&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.status, status) || other.status == status)&&(identical(other.orders, orders) || other.orders == orders)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.income, income) || other.income == income)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.iconBackground, iconBackground) || other.iconBackground == iconBackground));
}


@override
int get hashCode => Object.hash(runtimeType,date,time,platform,status,orders,duration,income,distance,icon,iconColor,iconBackground);

@override
String toString() {
  return 'Activity(date: $date, time: $time, platform: $platform, status: $status, orders: $orders, duration: $duration, income: $income, distance: $distance, icon: $icon, iconColor: $iconColor, iconBackground: $iconBackground)';
}


}

/// @nodoc
abstract mixin class _$ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$ActivityCopyWith(_Activity value, $Res Function(_Activity) _then) = __$ActivityCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, String time, String platform, String status, int orders, Duration duration, int income, int distance, IconData icon, Color iconColor, Color iconBackground
});




}
/// @nodoc
class __$ActivityCopyWithImpl<$Res>
    implements _$ActivityCopyWith<$Res> {
  __$ActivityCopyWithImpl(this._self, this._then);

  final _Activity _self;
  final $Res Function(_Activity) _then;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? time = null,Object? platform = null,Object? status = null,Object? orders = null,Object? duration = null,Object? income = null,Object? distance = null,Object? icon = null,Object? iconColor = null,Object? iconBackground = null,}) {
  return _then(_Activity(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as Color,iconBackground: null == iconBackground ? _self.iconBackground : iconBackground // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
