// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motorcycle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Motorcycle {

 int get id; String get brand; String get model; String get year; String get transmission; String get policeNumber; int get kilometers; int get avgKilometersPerDay; int get userId; DateTime? get lastServiceDate; String? get motorUrl;
/// Create a copy of Motorcycle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MotorcycleCopyWith<Motorcycle> get copyWith => _$MotorcycleCopyWithImpl<Motorcycle>(this as Motorcycle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Motorcycle&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.policeNumber, policeNumber) || other.policeNumber == policeNumber)&&(identical(other.kilometers, kilometers) || other.kilometers == kilometers)&&(identical(other.avgKilometersPerDay, avgKilometersPerDay) || other.avgKilometersPerDay == avgKilometersPerDay)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastServiceDate, lastServiceDate) || other.lastServiceDate == lastServiceDate)&&(identical(other.motorUrl, motorUrl) || other.motorUrl == motorUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,brand,model,year,transmission,policeNumber,kilometers,avgKilometersPerDay,userId,lastServiceDate,motorUrl);

@override
String toString() {
  return 'Motorcycle(id: $id, brand: $brand, model: $model, year: $year, transmission: $transmission, policeNumber: $policeNumber, kilometers: $kilometers, avgKilometersPerDay: $avgKilometersPerDay, userId: $userId, lastServiceDate: $lastServiceDate, motorUrl: $motorUrl)';
}


}

/// @nodoc
abstract mixin class $MotorcycleCopyWith<$Res>  {
  factory $MotorcycleCopyWith(Motorcycle value, $Res Function(Motorcycle) _then) = _$MotorcycleCopyWithImpl;
@useResult
$Res call({
 int id, String brand, String model, String year, String transmission, String policeNumber, int kilometers, int avgKilometersPerDay, int userId, DateTime? lastServiceDate, String? motorUrl
});




}
/// @nodoc
class _$MotorcycleCopyWithImpl<$Res>
    implements $MotorcycleCopyWith<$Res> {
  _$MotorcycleCopyWithImpl(this._self, this._then);

  final Motorcycle _self;
  final $Res Function(Motorcycle) _then;

/// Create a copy of Motorcycle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brand = null,Object? model = null,Object? year = null,Object? transmission = null,Object? policeNumber = null,Object? kilometers = null,Object? avgKilometersPerDay = null,Object? userId = null,Object? lastServiceDate = freezed,Object? motorUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,policeNumber: null == policeNumber ? _self.policeNumber : policeNumber // ignore: cast_nullable_to_non_nullable
as String,kilometers: null == kilometers ? _self.kilometers : kilometers // ignore: cast_nullable_to_non_nullable
as int,avgKilometersPerDay: null == avgKilometersPerDay ? _self.avgKilometersPerDay : avgKilometersPerDay // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,lastServiceDate: freezed == lastServiceDate ? _self.lastServiceDate : lastServiceDate // ignore: cast_nullable_to_non_nullable
as DateTime?,motorUrl: freezed == motorUrl ? _self.motorUrl : motorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Motorcycle].
extension MotorcyclePatterns on Motorcycle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Motorcycle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Motorcycle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Motorcycle value)  $default,){
final _that = this;
switch (_that) {
case _Motorcycle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Motorcycle value)?  $default,){
final _that = this;
switch (_that) {
case _Motorcycle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String brand,  String model,  String year,  String transmission,  String policeNumber,  int kilometers,  int avgKilometersPerDay,  int userId,  DateTime? lastServiceDate,  String? motorUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Motorcycle() when $default != null:
return $default(_that.id,_that.brand,_that.model,_that.year,_that.transmission,_that.policeNumber,_that.kilometers,_that.avgKilometersPerDay,_that.userId,_that.lastServiceDate,_that.motorUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String brand,  String model,  String year,  String transmission,  String policeNumber,  int kilometers,  int avgKilometersPerDay,  int userId,  DateTime? lastServiceDate,  String? motorUrl)  $default,) {final _that = this;
switch (_that) {
case _Motorcycle():
return $default(_that.id,_that.brand,_that.model,_that.year,_that.transmission,_that.policeNumber,_that.kilometers,_that.avgKilometersPerDay,_that.userId,_that.lastServiceDate,_that.motorUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String brand,  String model,  String year,  String transmission,  String policeNumber,  int kilometers,  int avgKilometersPerDay,  int userId,  DateTime? lastServiceDate,  String? motorUrl)?  $default,) {final _that = this;
switch (_that) {
case _Motorcycle() when $default != null:
return $default(_that.id,_that.brand,_that.model,_that.year,_that.transmission,_that.policeNumber,_that.kilometers,_that.avgKilometersPerDay,_that.userId,_that.lastServiceDate,_that.motorUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Motorcycle implements Motorcycle {
  const _Motorcycle({required this.id, required this.brand, required this.model, required this.year, required this.transmission, required this.policeNumber, required this.kilometers, required this.avgKilometersPerDay, required this.userId, this.lastServiceDate, this.motorUrl});
  

@override final  int id;
@override final  String brand;
@override final  String model;
@override final  String year;
@override final  String transmission;
@override final  String policeNumber;
@override final  int kilometers;
@override final  int avgKilometersPerDay;
@override final  int userId;
@override final  DateTime? lastServiceDate;
@override final  String? motorUrl;

/// Create a copy of Motorcycle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MotorcycleCopyWith<_Motorcycle> get copyWith => __$MotorcycleCopyWithImpl<_Motorcycle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Motorcycle&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.policeNumber, policeNumber) || other.policeNumber == policeNumber)&&(identical(other.kilometers, kilometers) || other.kilometers == kilometers)&&(identical(other.avgKilometersPerDay, avgKilometersPerDay) || other.avgKilometersPerDay == avgKilometersPerDay)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastServiceDate, lastServiceDate) || other.lastServiceDate == lastServiceDate)&&(identical(other.motorUrl, motorUrl) || other.motorUrl == motorUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,brand,model,year,transmission,policeNumber,kilometers,avgKilometersPerDay,userId,lastServiceDate,motorUrl);

@override
String toString() {
  return 'Motorcycle(id: $id, brand: $brand, model: $model, year: $year, transmission: $transmission, policeNumber: $policeNumber, kilometers: $kilometers, avgKilometersPerDay: $avgKilometersPerDay, userId: $userId, lastServiceDate: $lastServiceDate, motorUrl: $motorUrl)';
}


}

/// @nodoc
abstract mixin class _$MotorcycleCopyWith<$Res> implements $MotorcycleCopyWith<$Res> {
  factory _$MotorcycleCopyWith(_Motorcycle value, $Res Function(_Motorcycle) _then) = __$MotorcycleCopyWithImpl;
@override @useResult
$Res call({
 int id, String brand, String model, String year, String transmission, String policeNumber, int kilometers, int avgKilometersPerDay, int userId, DateTime? lastServiceDate, String? motorUrl
});




}
/// @nodoc
class __$MotorcycleCopyWithImpl<$Res>
    implements _$MotorcycleCopyWith<$Res> {
  __$MotorcycleCopyWithImpl(this._self, this._then);

  final _Motorcycle _self;
  final $Res Function(_Motorcycle) _then;

/// Create a copy of Motorcycle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brand = null,Object? model = null,Object? year = null,Object? transmission = null,Object? policeNumber = null,Object? kilometers = null,Object? avgKilometersPerDay = null,Object? userId = null,Object? lastServiceDate = freezed,Object? motorUrl = freezed,}) {
  return _then(_Motorcycle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,policeNumber: null == policeNumber ? _self.policeNumber : policeNumber // ignore: cast_nullable_to_non_nullable
as String,kilometers: null == kilometers ? _self.kilometers : kilometers // ignore: cast_nullable_to_non_nullable
as int,avgKilometersPerDay: null == avgKilometersPerDay ? _self.avgKilometersPerDay : avgKilometersPerDay // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,lastServiceDate: freezed == lastServiceDate ? _self.lastServiceDate : lastServiceDate // ignore: cast_nullable_to_non_nullable
as DateTime?,motorUrl: freezed == motorUrl ? _self.motorUrl : motorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
