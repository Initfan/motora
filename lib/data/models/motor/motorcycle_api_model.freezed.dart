// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motorcycle_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MotorcycleApiModel {

 int get id; String get brand; String get model; String get year; String get transmission;@JsonKey(name: 'police_number') String get policeNumber; int get kilometers;@JsonKey(name: 'avg_kilometers_per_day') int get avgKilometersPerDay;@JsonKey(name: 'last_service_date') DateTime? get lastServiceDate;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'motor_url') String? get motorUrl;
/// Create a copy of MotorcycleApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MotorcycleApiModelCopyWith<MotorcycleApiModel> get copyWith => _$MotorcycleApiModelCopyWithImpl<MotorcycleApiModel>(this as MotorcycleApiModel, _$identity);

  /// Serializes this MotorcycleApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MotorcycleApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.policeNumber, policeNumber) || other.policeNumber == policeNumber)&&(identical(other.kilometers, kilometers) || other.kilometers == kilometers)&&(identical(other.avgKilometersPerDay, avgKilometersPerDay) || other.avgKilometersPerDay == avgKilometersPerDay)&&(identical(other.lastServiceDate, lastServiceDate) || other.lastServiceDate == lastServiceDate)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.motorUrl, motorUrl) || other.motorUrl == motorUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brand,model,year,transmission,policeNumber,kilometers,avgKilometersPerDay,lastServiceDate,userId,motorUrl);

@override
String toString() {
  return 'MotorcycleApiModel(id: $id, brand: $brand, model: $model, year: $year, transmission: $transmission, policeNumber: $policeNumber, kilometers: $kilometers, avgKilometersPerDay: $avgKilometersPerDay, lastServiceDate: $lastServiceDate, userId: $userId, motorUrl: $motorUrl)';
}


}

/// @nodoc
abstract mixin class $MotorcycleApiModelCopyWith<$Res>  {
  factory $MotorcycleApiModelCopyWith(MotorcycleApiModel value, $Res Function(MotorcycleApiModel) _then) = _$MotorcycleApiModelCopyWithImpl;
@useResult
$Res call({
 int id, String brand, String model, String year, String transmission,@JsonKey(name: 'police_number') String policeNumber, int kilometers,@JsonKey(name: 'avg_kilometers_per_day') int avgKilometersPerDay,@JsonKey(name: 'last_service_date') DateTime? lastServiceDate,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'motor_url') String? motorUrl
});




}
/// @nodoc
class _$MotorcycleApiModelCopyWithImpl<$Res>
    implements $MotorcycleApiModelCopyWith<$Res> {
  _$MotorcycleApiModelCopyWithImpl(this._self, this._then);

  final MotorcycleApiModel _self;
  final $Res Function(MotorcycleApiModel) _then;

/// Create a copy of MotorcycleApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brand = null,Object? model = null,Object? year = null,Object? transmission = null,Object? policeNumber = null,Object? kilometers = null,Object? avgKilometersPerDay = null,Object? lastServiceDate = freezed,Object? userId = null,Object? motorUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,policeNumber: null == policeNumber ? _self.policeNumber : policeNumber // ignore: cast_nullable_to_non_nullable
as String,kilometers: null == kilometers ? _self.kilometers : kilometers // ignore: cast_nullable_to_non_nullable
as int,avgKilometersPerDay: null == avgKilometersPerDay ? _self.avgKilometersPerDay : avgKilometersPerDay // ignore: cast_nullable_to_non_nullable
as int,lastServiceDate: freezed == lastServiceDate ? _self.lastServiceDate : lastServiceDate // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,motorUrl: freezed == motorUrl ? _self.motorUrl : motorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MotorcycleApiModel].
extension MotorcycleApiModelPatterns on MotorcycleApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MotorcycleApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MotorcycleApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MotorcycleApiModel value)  $default,){
final _that = this;
switch (_that) {
case _MotorcycleApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MotorcycleApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _MotorcycleApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String brand,  String model,  String year,  String transmission, @JsonKey(name: 'police_number')  String policeNumber,  int kilometers, @JsonKey(name: 'avg_kilometers_per_day')  int avgKilometersPerDay, @JsonKey(name: 'last_service_date')  DateTime? lastServiceDate, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'motor_url')  String? motorUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MotorcycleApiModel() when $default != null:
return $default(_that.id,_that.brand,_that.model,_that.year,_that.transmission,_that.policeNumber,_that.kilometers,_that.avgKilometersPerDay,_that.lastServiceDate,_that.userId,_that.motorUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String brand,  String model,  String year,  String transmission, @JsonKey(name: 'police_number')  String policeNumber,  int kilometers, @JsonKey(name: 'avg_kilometers_per_day')  int avgKilometersPerDay, @JsonKey(name: 'last_service_date')  DateTime? lastServiceDate, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'motor_url')  String? motorUrl)  $default,) {final _that = this;
switch (_that) {
case _MotorcycleApiModel():
return $default(_that.id,_that.brand,_that.model,_that.year,_that.transmission,_that.policeNumber,_that.kilometers,_that.avgKilometersPerDay,_that.lastServiceDate,_that.userId,_that.motorUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String brand,  String model,  String year,  String transmission, @JsonKey(name: 'police_number')  String policeNumber,  int kilometers, @JsonKey(name: 'avg_kilometers_per_day')  int avgKilometersPerDay, @JsonKey(name: 'last_service_date')  DateTime? lastServiceDate, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'motor_url')  String? motorUrl)?  $default,) {final _that = this;
switch (_that) {
case _MotorcycleApiModel() when $default != null:
return $default(_that.id,_that.brand,_that.model,_that.year,_that.transmission,_that.policeNumber,_that.kilometers,_that.avgKilometersPerDay,_that.lastServiceDate,_that.userId,_that.motorUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MotorcycleApiModel implements MotorcycleApiModel {
  const _MotorcycleApiModel({required this.id, required this.brand, required this.model, required this.year, required this.transmission, @JsonKey(name: 'police_number') required this.policeNumber, required this.kilometers, @JsonKey(name: 'avg_kilometers_per_day') this.avgKilometersPerDay = 0, @JsonKey(name: 'last_service_date') this.lastServiceDate, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'motor_url') this.motorUrl});
  factory _MotorcycleApiModel.fromJson(Map<String, dynamic> json) => _$MotorcycleApiModelFromJson(json);

@override final  int id;
@override final  String brand;
@override final  String model;
@override final  String year;
@override final  String transmission;
@override@JsonKey(name: 'police_number') final  String policeNumber;
@override final  int kilometers;
@override@JsonKey(name: 'avg_kilometers_per_day') final  int avgKilometersPerDay;
@override@JsonKey(name: 'last_service_date') final  DateTime? lastServiceDate;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'motor_url') final  String? motorUrl;

/// Create a copy of MotorcycleApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MotorcycleApiModelCopyWith<_MotorcycleApiModel> get copyWith => __$MotorcycleApiModelCopyWithImpl<_MotorcycleApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MotorcycleApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MotorcycleApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.policeNumber, policeNumber) || other.policeNumber == policeNumber)&&(identical(other.kilometers, kilometers) || other.kilometers == kilometers)&&(identical(other.avgKilometersPerDay, avgKilometersPerDay) || other.avgKilometersPerDay == avgKilometersPerDay)&&(identical(other.lastServiceDate, lastServiceDate) || other.lastServiceDate == lastServiceDate)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.motorUrl, motorUrl) || other.motorUrl == motorUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brand,model,year,transmission,policeNumber,kilometers,avgKilometersPerDay,lastServiceDate,userId,motorUrl);

@override
String toString() {
  return 'MotorcycleApiModel(id: $id, brand: $brand, model: $model, year: $year, transmission: $transmission, policeNumber: $policeNumber, kilometers: $kilometers, avgKilometersPerDay: $avgKilometersPerDay, lastServiceDate: $lastServiceDate, userId: $userId, motorUrl: $motorUrl)';
}


}

/// @nodoc
abstract mixin class _$MotorcycleApiModelCopyWith<$Res> implements $MotorcycleApiModelCopyWith<$Res> {
  factory _$MotorcycleApiModelCopyWith(_MotorcycleApiModel value, $Res Function(_MotorcycleApiModel) _then) = __$MotorcycleApiModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String brand, String model, String year, String transmission,@JsonKey(name: 'police_number') String policeNumber, int kilometers,@JsonKey(name: 'avg_kilometers_per_day') int avgKilometersPerDay,@JsonKey(name: 'last_service_date') DateTime? lastServiceDate,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'motor_url') String? motorUrl
});




}
/// @nodoc
class __$MotorcycleApiModelCopyWithImpl<$Res>
    implements _$MotorcycleApiModelCopyWith<$Res> {
  __$MotorcycleApiModelCopyWithImpl(this._self, this._then);

  final _MotorcycleApiModel _self;
  final $Res Function(_MotorcycleApiModel) _then;

/// Create a copy of MotorcycleApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brand = null,Object? model = null,Object? year = null,Object? transmission = null,Object? policeNumber = null,Object? kilometers = null,Object? avgKilometersPerDay = null,Object? lastServiceDate = freezed,Object? userId = null,Object? motorUrl = freezed,}) {
  return _then(_MotorcycleApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,policeNumber: null == policeNumber ? _self.policeNumber : policeNumber // ignore: cast_nullable_to_non_nullable
as String,kilometers: null == kilometers ? _self.kilometers : kilometers // ignore: cast_nullable_to_non_nullable
as int,avgKilometersPerDay: null == avgKilometersPerDay ? _self.avgKilometersPerDay : avgKilometersPerDay // ignore: cast_nullable_to_non_nullable
as int,lastServiceDate: freezed == lastServiceDate ? _self.lastServiceDate : lastServiceDate // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,motorUrl: freezed == motorUrl ? _self.motorUrl : motorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
