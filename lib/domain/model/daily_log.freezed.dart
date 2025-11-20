// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyLog {

 DateTime get date;// 記録日
 double get weight;// 体重
 bool get isTrained;
/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyLogCopyWith<DailyLog> get copyWith => _$DailyLogCopyWithImpl<DailyLog>(this as DailyLog, _$identity);

  /// Serializes this DailyLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyLog&&(identical(other.date, date) || other.date == date)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.isTrained, isTrained) || other.isTrained == isTrained));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,weight,isTrained);

@override
String toString() {
  return 'DailyLog(date: $date, weight: $weight, isTrained: $isTrained)';
}


}

/// @nodoc
abstract mixin class $DailyLogCopyWith<$Res>  {
  factory $DailyLogCopyWith(DailyLog value, $Res Function(DailyLog) _then) = _$DailyLogCopyWithImpl;
@useResult
$Res call({
 DateTime date, double weight, bool isTrained
});




}
/// @nodoc
class _$DailyLogCopyWithImpl<$Res>
    implements $DailyLogCopyWith<$Res> {
  _$DailyLogCopyWithImpl(this._self, this._then);

  final DailyLog _self;
  final $Res Function(DailyLog) _then;

/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? weight = null,Object? isTrained = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,isTrained: null == isTrained ? _self.isTrained : isTrained // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyLog].
extension DailyLogPatterns on DailyLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyLog value)  $default,){
final _that = this;
switch (_that) {
case _DailyLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyLog value)?  $default,){
final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double weight,  bool isTrained)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
return $default(_that.date,_that.weight,_that.isTrained);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double weight,  bool isTrained)  $default,) {final _that = this;
switch (_that) {
case _DailyLog():
return $default(_that.date,_that.weight,_that.isTrained);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double weight,  bool isTrained)?  $default,) {final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
return $default(_that.date,_that.weight,_that.isTrained);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyLog implements DailyLog {
  const _DailyLog({required this.date, required this.weight, this.isTrained = false});
  factory _DailyLog.fromJson(Map<String, dynamic> json) => _$DailyLogFromJson(json);

@override final  DateTime date;
// 記録日
@override final  double weight;
// 体重
@override@JsonKey() final  bool isTrained;

/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyLogCopyWith<_DailyLog> get copyWith => __$DailyLogCopyWithImpl<_DailyLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyLog&&(identical(other.date, date) || other.date == date)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.isTrained, isTrained) || other.isTrained == isTrained));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,weight,isTrained);

@override
String toString() {
  return 'DailyLog(date: $date, weight: $weight, isTrained: $isTrained)';
}


}

/// @nodoc
abstract mixin class _$DailyLogCopyWith<$Res> implements $DailyLogCopyWith<$Res> {
  factory _$DailyLogCopyWith(_DailyLog value, $Res Function(_DailyLog) _then) = __$DailyLogCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double weight, bool isTrained
});




}
/// @nodoc
class __$DailyLogCopyWithImpl<$Res>
    implements _$DailyLogCopyWith<$Res> {
  __$DailyLogCopyWithImpl(this._self, this._then);

  final _DailyLog _self;
  final $Res Function(_DailyLog) _then;

/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? weight = null,Object? isTrained = null,}) {
  return _then(_DailyLog(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,isTrained: null == isTrained ? _self.isTrained : isTrained // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
