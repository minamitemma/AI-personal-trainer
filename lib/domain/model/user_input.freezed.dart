// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInput {

 String get planName;// ユーザーの目標（例: 増量, 減量, 維持, 筋力向上）
 String get goalType;// 目標体重 (Freezedは初期化時にフィールド名をキャメルケースに修正します)
 int get goalWeight; String get targetDuration;// 現在の身体情報
 int get heightCm; int get weightKg; int get age;// トレーニング経験レベル
 String get experienceLevel;// 週のトレーニング可能日数
 int get availableDays;// 食生活の制約
 String get dietRestriction;// 🚨 追加: ユーザーからの自由な要望
 String get additionalRequest;
/// Create a copy of UserInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInputCopyWith<UserInput> get copyWith => _$UserInputCopyWithImpl<UserInput>(this as UserInput, _$identity);

  /// Serializes this UserInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInput&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.goalType, goalType) || other.goalType == goalType)&&(identical(other.goalWeight, goalWeight) || other.goalWeight == goalWeight)&&(identical(other.targetDuration, targetDuration) || other.targetDuration == targetDuration)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.age, age) || other.age == age)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.availableDays, availableDays) || other.availableDays == availableDays)&&(identical(other.dietRestriction, dietRestriction) || other.dietRestriction == dietRestriction)&&(identical(other.additionalRequest, additionalRequest) || other.additionalRequest == additionalRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,planName,goalType,goalWeight,targetDuration,heightCm,weightKg,age,experienceLevel,availableDays,dietRestriction,additionalRequest);

@override
String toString() {
  return 'UserInput(planName: $planName, goalType: $goalType, goalWeight: $goalWeight, targetDuration: $targetDuration, heightCm: $heightCm, weightKg: $weightKg, age: $age, experienceLevel: $experienceLevel, availableDays: $availableDays, dietRestriction: $dietRestriction, additionalRequest: $additionalRequest)';
}


}

/// @nodoc
abstract mixin class $UserInputCopyWith<$Res>  {
  factory $UserInputCopyWith(UserInput value, $Res Function(UserInput) _then) = _$UserInputCopyWithImpl;
@useResult
$Res call({
 String planName, String goalType, int goalWeight, String targetDuration, int heightCm, int weightKg, int age, String experienceLevel, int availableDays, String dietRestriction, String additionalRequest
});




}
/// @nodoc
class _$UserInputCopyWithImpl<$Res>
    implements $UserInputCopyWith<$Res> {
  _$UserInputCopyWithImpl(this._self, this._then);

  final UserInput _self;
  final $Res Function(UserInput) _then;

/// Create a copy of UserInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? planName = null,Object? goalType = null,Object? goalWeight = null,Object? targetDuration = null,Object? heightCm = null,Object? weightKg = null,Object? age = null,Object? experienceLevel = null,Object? availableDays = null,Object? dietRestriction = null,Object? additionalRequest = null,}) {
  return _then(_self.copyWith(
planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,goalType: null == goalType ? _self.goalType : goalType // ignore: cast_nullable_to_non_nullable
as String,goalWeight: null == goalWeight ? _self.goalWeight : goalWeight // ignore: cast_nullable_to_non_nullable
as int,targetDuration: null == targetDuration ? _self.targetDuration : targetDuration // ignore: cast_nullable_to_non_nullable
as String,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as int,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String,availableDays: null == availableDays ? _self.availableDays : availableDays // ignore: cast_nullable_to_non_nullable
as int,dietRestriction: null == dietRestriction ? _self.dietRestriction : dietRestriction // ignore: cast_nullable_to_non_nullable
as String,additionalRequest: null == additionalRequest ? _self.additionalRequest : additionalRequest // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInput].
extension UserInputPatterns on UserInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInput value)  $default,){
final _that = this;
switch (_that) {
case _UserInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInput value)?  $default,){
final _that = this;
switch (_that) {
case _UserInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String planName,  String goalType,  int goalWeight,  String targetDuration,  int heightCm,  int weightKg,  int age,  String experienceLevel,  int availableDays,  String dietRestriction,  String additionalRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInput() when $default != null:
return $default(_that.planName,_that.goalType,_that.goalWeight,_that.targetDuration,_that.heightCm,_that.weightKg,_that.age,_that.experienceLevel,_that.availableDays,_that.dietRestriction,_that.additionalRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String planName,  String goalType,  int goalWeight,  String targetDuration,  int heightCm,  int weightKg,  int age,  String experienceLevel,  int availableDays,  String dietRestriction,  String additionalRequest)  $default,) {final _that = this;
switch (_that) {
case _UserInput():
return $default(_that.planName,_that.goalType,_that.goalWeight,_that.targetDuration,_that.heightCm,_that.weightKg,_that.age,_that.experienceLevel,_that.availableDays,_that.dietRestriction,_that.additionalRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String planName,  String goalType,  int goalWeight,  String targetDuration,  int heightCm,  int weightKg,  int age,  String experienceLevel,  int availableDays,  String dietRestriction,  String additionalRequest)?  $default,) {final _that = this;
switch (_that) {
case _UserInput() when $default != null:
return $default(_that.planName,_that.goalType,_that.goalWeight,_that.targetDuration,_that.heightCm,_that.weightKg,_that.age,_that.experienceLevel,_that.availableDays,_that.dietRestriction,_that.additionalRequest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserInput implements UserInput {
  const _UserInput({this.planName = '', this.goalType = '', this.goalWeight = 0, this.targetDuration = '', this.heightCm = 0, this.weightKg = 0, this.age = 0, this.experienceLevel = '', this.availableDays = 0, this.dietRestriction = '', this.additionalRequest = ''});
  factory _UserInput.fromJson(Map<String, dynamic> json) => _$UserInputFromJson(json);

@override@JsonKey() final  String planName;
// ユーザーの目標（例: 増量, 減量, 維持, 筋力向上）
@override@JsonKey() final  String goalType;
// 目標体重 (Freezedは初期化時にフィールド名をキャメルケースに修正します)
@override@JsonKey() final  int goalWeight;
@override@JsonKey() final  String targetDuration;
// 現在の身体情報
@override@JsonKey() final  int heightCm;
@override@JsonKey() final  int weightKg;
@override@JsonKey() final  int age;
// トレーニング経験レベル
@override@JsonKey() final  String experienceLevel;
// 週のトレーニング可能日数
@override@JsonKey() final  int availableDays;
// 食生活の制約
@override@JsonKey() final  String dietRestriction;
// 🚨 追加: ユーザーからの自由な要望
@override@JsonKey() final  String additionalRequest;

/// Create a copy of UserInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInputCopyWith<_UserInput> get copyWith => __$UserInputCopyWithImpl<_UserInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInput&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.goalType, goalType) || other.goalType == goalType)&&(identical(other.goalWeight, goalWeight) || other.goalWeight == goalWeight)&&(identical(other.targetDuration, targetDuration) || other.targetDuration == targetDuration)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.age, age) || other.age == age)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.availableDays, availableDays) || other.availableDays == availableDays)&&(identical(other.dietRestriction, dietRestriction) || other.dietRestriction == dietRestriction)&&(identical(other.additionalRequest, additionalRequest) || other.additionalRequest == additionalRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,planName,goalType,goalWeight,targetDuration,heightCm,weightKg,age,experienceLevel,availableDays,dietRestriction,additionalRequest);

@override
String toString() {
  return 'UserInput(planName: $planName, goalType: $goalType, goalWeight: $goalWeight, targetDuration: $targetDuration, heightCm: $heightCm, weightKg: $weightKg, age: $age, experienceLevel: $experienceLevel, availableDays: $availableDays, dietRestriction: $dietRestriction, additionalRequest: $additionalRequest)';
}


}

/// @nodoc
abstract mixin class _$UserInputCopyWith<$Res> implements $UserInputCopyWith<$Res> {
  factory _$UserInputCopyWith(_UserInput value, $Res Function(_UserInput) _then) = __$UserInputCopyWithImpl;
@override @useResult
$Res call({
 String planName, String goalType, int goalWeight, String targetDuration, int heightCm, int weightKg, int age, String experienceLevel, int availableDays, String dietRestriction, String additionalRequest
});




}
/// @nodoc
class __$UserInputCopyWithImpl<$Res>
    implements _$UserInputCopyWith<$Res> {
  __$UserInputCopyWithImpl(this._self, this._then);

  final _UserInput _self;
  final $Res Function(_UserInput) _then;

/// Create a copy of UserInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planName = null,Object? goalType = null,Object? goalWeight = null,Object? targetDuration = null,Object? heightCm = null,Object? weightKg = null,Object? age = null,Object? experienceLevel = null,Object? availableDays = null,Object? dietRestriction = null,Object? additionalRequest = null,}) {
  return _then(_UserInput(
planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,goalType: null == goalType ? _self.goalType : goalType // ignore: cast_nullable_to_non_nullable
as String,goalWeight: null == goalWeight ? _self.goalWeight : goalWeight // ignore: cast_nullable_to_non_nullable
as int,targetDuration: null == targetDuration ? _self.targetDuration : targetDuration // ignore: cast_nullable_to_non_nullable
as String,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as int,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String,availableDays: null == availableDays ? _self.availableDays : availableDays // ignore: cast_nullable_to_non_nullable
as int,dietRestriction: null == dietRestriction ? _self.dietRestriction : dietRestriction // ignore: cast_nullable_to_non_nullable
as String,additionalRequest: null == additionalRequest ? _self.additionalRequest : additionalRequest // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
