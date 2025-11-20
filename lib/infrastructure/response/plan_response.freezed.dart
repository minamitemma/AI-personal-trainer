// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanResponse {

@JsonKey(name: 'weekly_workouts') List<Map<String, dynamic>> get trainingMenuJson;@JsonKey(name: 'sample_meals') List<Map<String, dynamic>> get nutritionPlanJson;@JsonKey(name: 'plan_id') String get planId;@JsonKey(name: 'goal_summary') String get goalSummary;@JsonKey(name: 'calorieTarget') int get calorieTarget;@JsonKey(name: 'macronutrients') Map<String, dynamic> get macronutrients;
/// Create a copy of PlanResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanResponseCopyWith<PlanResponse> get copyWith => _$PlanResponseCopyWithImpl<PlanResponse>(this as PlanResponse, _$identity);

  /// Serializes this PlanResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanResponse&&const DeepCollectionEquality().equals(other.trainingMenuJson, trainingMenuJson)&&const DeepCollectionEquality().equals(other.nutritionPlanJson, nutritionPlanJson)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.goalSummary, goalSummary) || other.goalSummary == goalSummary)&&(identical(other.calorieTarget, calorieTarget) || other.calorieTarget == calorieTarget)&&const DeepCollectionEquality().equals(other.macronutrients, macronutrients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(trainingMenuJson),const DeepCollectionEquality().hash(nutritionPlanJson),planId,goalSummary,calorieTarget,const DeepCollectionEquality().hash(macronutrients));

@override
String toString() {
  return 'PlanResponse(trainingMenuJson: $trainingMenuJson, nutritionPlanJson: $nutritionPlanJson, planId: $planId, goalSummary: $goalSummary, calorieTarget: $calorieTarget, macronutrients: $macronutrients)';
}


}

/// @nodoc
abstract mixin class $PlanResponseCopyWith<$Res>  {
  factory $PlanResponseCopyWith(PlanResponse value, $Res Function(PlanResponse) _then) = _$PlanResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'weekly_workouts') List<Map<String, dynamic>> trainingMenuJson,@JsonKey(name: 'sample_meals') List<Map<String, dynamic>> nutritionPlanJson,@JsonKey(name: 'plan_id') String planId,@JsonKey(name: 'goal_summary') String goalSummary,@JsonKey(name: 'calorieTarget') int calorieTarget,@JsonKey(name: 'macronutrients') Map<String, dynamic> macronutrients
});




}
/// @nodoc
class _$PlanResponseCopyWithImpl<$Res>
    implements $PlanResponseCopyWith<$Res> {
  _$PlanResponseCopyWithImpl(this._self, this._then);

  final PlanResponse _self;
  final $Res Function(PlanResponse) _then;

/// Create a copy of PlanResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trainingMenuJson = null,Object? nutritionPlanJson = null,Object? planId = null,Object? goalSummary = null,Object? calorieTarget = null,Object? macronutrients = null,}) {
  return _then(_self.copyWith(
trainingMenuJson: null == trainingMenuJson ? _self.trainingMenuJson : trainingMenuJson // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,nutritionPlanJson: null == nutritionPlanJson ? _self.nutritionPlanJson : nutritionPlanJson // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,goalSummary: null == goalSummary ? _self.goalSummary : goalSummary // ignore: cast_nullable_to_non_nullable
as String,calorieTarget: null == calorieTarget ? _self.calorieTarget : calorieTarget // ignore: cast_nullable_to_non_nullable
as int,macronutrients: null == macronutrients ? _self.macronutrients : macronutrients // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanResponse].
extension PlanResponsePatterns on PlanResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanResponse value)  $default,){
final _that = this;
switch (_that) {
case _PlanResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PlanResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'weekly_workouts')  List<Map<String, dynamic>> trainingMenuJson, @JsonKey(name: 'sample_meals')  List<Map<String, dynamic>> nutritionPlanJson, @JsonKey(name: 'plan_id')  String planId, @JsonKey(name: 'goal_summary')  String goalSummary, @JsonKey(name: 'calorieTarget')  int calorieTarget, @JsonKey(name: 'macronutrients')  Map<String, dynamic> macronutrients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanResponse() when $default != null:
return $default(_that.trainingMenuJson,_that.nutritionPlanJson,_that.planId,_that.goalSummary,_that.calorieTarget,_that.macronutrients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'weekly_workouts')  List<Map<String, dynamic>> trainingMenuJson, @JsonKey(name: 'sample_meals')  List<Map<String, dynamic>> nutritionPlanJson, @JsonKey(name: 'plan_id')  String planId, @JsonKey(name: 'goal_summary')  String goalSummary, @JsonKey(name: 'calorieTarget')  int calorieTarget, @JsonKey(name: 'macronutrients')  Map<String, dynamic> macronutrients)  $default,) {final _that = this;
switch (_that) {
case _PlanResponse():
return $default(_that.trainingMenuJson,_that.nutritionPlanJson,_that.planId,_that.goalSummary,_that.calorieTarget,_that.macronutrients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'weekly_workouts')  List<Map<String, dynamic>> trainingMenuJson, @JsonKey(name: 'sample_meals')  List<Map<String, dynamic>> nutritionPlanJson, @JsonKey(name: 'plan_id')  String planId, @JsonKey(name: 'goal_summary')  String goalSummary, @JsonKey(name: 'calorieTarget')  int calorieTarget, @JsonKey(name: 'macronutrients')  Map<String, dynamic> macronutrients)?  $default,) {final _that = this;
switch (_that) {
case _PlanResponse() when $default != null:
return $default(_that.trainingMenuJson,_that.nutritionPlanJson,_that.planId,_that.goalSummary,_that.calorieTarget,_that.macronutrients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanResponse implements PlanResponse {
  const _PlanResponse({@JsonKey(name: 'weekly_workouts') final  List<Map<String, dynamic>> trainingMenuJson = const [], @JsonKey(name: 'sample_meals') final  List<Map<String, dynamic>> nutritionPlanJson = const [], @JsonKey(name: 'plan_id') this.planId = '', @JsonKey(name: 'goal_summary') this.goalSummary = '', @JsonKey(name: 'calorieTarget') this.calorieTarget = 0, @JsonKey(name: 'macronutrients') final  Map<String, dynamic> macronutrients = const {}}): _trainingMenuJson = trainingMenuJson,_nutritionPlanJson = nutritionPlanJson,_macronutrients = macronutrients;
  factory _PlanResponse.fromJson(Map<String, dynamic> json) => _$PlanResponseFromJson(json);

 final  List<Map<String, dynamic>> _trainingMenuJson;
@override@JsonKey(name: 'weekly_workouts') List<Map<String, dynamic>> get trainingMenuJson {
  if (_trainingMenuJson is EqualUnmodifiableListView) return _trainingMenuJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainingMenuJson);
}

 final  List<Map<String, dynamic>> _nutritionPlanJson;
@override@JsonKey(name: 'sample_meals') List<Map<String, dynamic>> get nutritionPlanJson {
  if (_nutritionPlanJson is EqualUnmodifiableListView) return _nutritionPlanJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nutritionPlanJson);
}

@override@JsonKey(name: 'plan_id') final  String planId;
@override@JsonKey(name: 'goal_summary') final  String goalSummary;
@override@JsonKey(name: 'calorieTarget') final  int calorieTarget;
 final  Map<String, dynamic> _macronutrients;
@override@JsonKey(name: 'macronutrients') Map<String, dynamic> get macronutrients {
  if (_macronutrients is EqualUnmodifiableMapView) return _macronutrients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_macronutrients);
}


/// Create a copy of PlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanResponseCopyWith<_PlanResponse> get copyWith => __$PlanResponseCopyWithImpl<_PlanResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanResponse&&const DeepCollectionEquality().equals(other._trainingMenuJson, _trainingMenuJson)&&const DeepCollectionEquality().equals(other._nutritionPlanJson, _nutritionPlanJson)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.goalSummary, goalSummary) || other.goalSummary == goalSummary)&&(identical(other.calorieTarget, calorieTarget) || other.calorieTarget == calorieTarget)&&const DeepCollectionEquality().equals(other._macronutrients, _macronutrients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_trainingMenuJson),const DeepCollectionEquality().hash(_nutritionPlanJson),planId,goalSummary,calorieTarget,const DeepCollectionEquality().hash(_macronutrients));

@override
String toString() {
  return 'PlanResponse(trainingMenuJson: $trainingMenuJson, nutritionPlanJson: $nutritionPlanJson, planId: $planId, goalSummary: $goalSummary, calorieTarget: $calorieTarget, macronutrients: $macronutrients)';
}


}

/// @nodoc
abstract mixin class _$PlanResponseCopyWith<$Res> implements $PlanResponseCopyWith<$Res> {
  factory _$PlanResponseCopyWith(_PlanResponse value, $Res Function(_PlanResponse) _then) = __$PlanResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'weekly_workouts') List<Map<String, dynamic>> trainingMenuJson,@JsonKey(name: 'sample_meals') List<Map<String, dynamic>> nutritionPlanJson,@JsonKey(name: 'plan_id') String planId,@JsonKey(name: 'goal_summary') String goalSummary,@JsonKey(name: 'calorieTarget') int calorieTarget,@JsonKey(name: 'macronutrients') Map<String, dynamic> macronutrients
});




}
/// @nodoc
class __$PlanResponseCopyWithImpl<$Res>
    implements _$PlanResponseCopyWith<$Res> {
  __$PlanResponseCopyWithImpl(this._self, this._then);

  final _PlanResponse _self;
  final $Res Function(_PlanResponse) _then;

/// Create a copy of PlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trainingMenuJson = null,Object? nutritionPlanJson = null,Object? planId = null,Object? goalSummary = null,Object? calorieTarget = null,Object? macronutrients = null,}) {
  return _then(_PlanResponse(
trainingMenuJson: null == trainingMenuJson ? _self._trainingMenuJson : trainingMenuJson // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,nutritionPlanJson: null == nutritionPlanJson ? _self._nutritionPlanJson : nutritionPlanJson // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,goalSummary: null == goalSummary ? _self.goalSummary : goalSummary // ignore: cast_nullable_to_non_nullable
as String,calorieTarget: null == calorieTarget ? _self.calorieTarget : calorieTarget // ignore: cast_nullable_to_non_nullable
as int,macronutrients: null == macronutrients ? _self._macronutrients : macronutrients // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
