// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanResult {

// 🚨 修正: fromJson関数を明示的に指定 🚨
@JsonKey(fromJson: NutritionPlan.fromJson) NutritionPlan get nutritionPlan;// 🚨 修正: fromJson関数を明示的に指定 🚨
@JsonKey(fromJson: TrainingMenu.fromJson) TrainingMenu get trainingMenu;
/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanResultCopyWith<PlanResult> get copyWith => _$PlanResultCopyWithImpl<PlanResult>(this as PlanResult, _$identity);

  /// Serializes this PlanResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanResult&&(identical(other.nutritionPlan, nutritionPlan) || other.nutritionPlan == nutritionPlan)&&(identical(other.trainingMenu, trainingMenu) || other.trainingMenu == trainingMenu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nutritionPlan,trainingMenu);

@override
String toString() {
  return 'PlanResult(nutritionPlan: $nutritionPlan, trainingMenu: $trainingMenu)';
}


}

/// @nodoc
abstract mixin class $PlanResultCopyWith<$Res>  {
  factory $PlanResultCopyWith(PlanResult value, $Res Function(PlanResult) _then) = _$PlanResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: NutritionPlan.fromJson) NutritionPlan nutritionPlan,@JsonKey(fromJson: TrainingMenu.fromJson) TrainingMenu trainingMenu
});


$NutritionPlanCopyWith<$Res> get nutritionPlan;$TrainingMenuCopyWith<$Res> get trainingMenu;

}
/// @nodoc
class _$PlanResultCopyWithImpl<$Res>
    implements $PlanResultCopyWith<$Res> {
  _$PlanResultCopyWithImpl(this._self, this._then);

  final PlanResult _self;
  final $Res Function(PlanResult) _then;

/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nutritionPlan = null,Object? trainingMenu = null,}) {
  return _then(_self.copyWith(
nutritionPlan: null == nutritionPlan ? _self.nutritionPlan : nutritionPlan // ignore: cast_nullable_to_non_nullable
as NutritionPlan,trainingMenu: null == trainingMenu ? _self.trainingMenu : trainingMenu // ignore: cast_nullable_to_non_nullable
as TrainingMenu,
  ));
}
/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionPlanCopyWith<$Res> get nutritionPlan {
  
  return $NutritionPlanCopyWith<$Res>(_self.nutritionPlan, (value) {
    return _then(_self.copyWith(nutritionPlan: value));
  });
}/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingMenuCopyWith<$Res> get trainingMenu {
  
  return $TrainingMenuCopyWith<$Res>(_self.trainingMenu, (value) {
    return _then(_self.copyWith(trainingMenu: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlanResult].
extension PlanResultPatterns on PlanResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanResult value)  $default,){
final _that = this;
switch (_that) {
case _PlanResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanResult value)?  $default,){
final _that = this;
switch (_that) {
case _PlanResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: NutritionPlan.fromJson)  NutritionPlan nutritionPlan, @JsonKey(fromJson: TrainingMenu.fromJson)  TrainingMenu trainingMenu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanResult() when $default != null:
return $default(_that.nutritionPlan,_that.trainingMenu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: NutritionPlan.fromJson)  NutritionPlan nutritionPlan, @JsonKey(fromJson: TrainingMenu.fromJson)  TrainingMenu trainingMenu)  $default,) {final _that = this;
switch (_that) {
case _PlanResult():
return $default(_that.nutritionPlan,_that.trainingMenu);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: NutritionPlan.fromJson)  NutritionPlan nutritionPlan, @JsonKey(fromJson: TrainingMenu.fromJson)  TrainingMenu trainingMenu)?  $default,) {final _that = this;
switch (_that) {
case _PlanResult() when $default != null:
return $default(_that.nutritionPlan,_that.trainingMenu);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanResult implements PlanResult {
  const _PlanResult({@JsonKey(fromJson: NutritionPlan.fromJson) required this.nutritionPlan, @JsonKey(fromJson: TrainingMenu.fromJson) required this.trainingMenu});
  factory _PlanResult.fromJson(Map<String, dynamic> json) => _$PlanResultFromJson(json);

// 🚨 修正: fromJson関数を明示的に指定 🚨
@override@JsonKey(fromJson: NutritionPlan.fromJson) final  NutritionPlan nutritionPlan;
// 🚨 修正: fromJson関数を明示的に指定 🚨
@override@JsonKey(fromJson: TrainingMenu.fromJson) final  TrainingMenu trainingMenu;

/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanResultCopyWith<_PlanResult> get copyWith => __$PlanResultCopyWithImpl<_PlanResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanResult&&(identical(other.nutritionPlan, nutritionPlan) || other.nutritionPlan == nutritionPlan)&&(identical(other.trainingMenu, trainingMenu) || other.trainingMenu == trainingMenu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nutritionPlan,trainingMenu);

@override
String toString() {
  return 'PlanResult(nutritionPlan: $nutritionPlan, trainingMenu: $trainingMenu)';
}


}

/// @nodoc
abstract mixin class _$PlanResultCopyWith<$Res> implements $PlanResultCopyWith<$Res> {
  factory _$PlanResultCopyWith(_PlanResult value, $Res Function(_PlanResult) _then) = __$PlanResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: NutritionPlan.fromJson) NutritionPlan nutritionPlan,@JsonKey(fromJson: TrainingMenu.fromJson) TrainingMenu trainingMenu
});


@override $NutritionPlanCopyWith<$Res> get nutritionPlan;@override $TrainingMenuCopyWith<$Res> get trainingMenu;

}
/// @nodoc
class __$PlanResultCopyWithImpl<$Res>
    implements _$PlanResultCopyWith<$Res> {
  __$PlanResultCopyWithImpl(this._self, this._then);

  final _PlanResult _self;
  final $Res Function(_PlanResult) _then;

/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nutritionPlan = null,Object? trainingMenu = null,}) {
  return _then(_PlanResult(
nutritionPlan: null == nutritionPlan ? _self.nutritionPlan : nutritionPlan // ignore: cast_nullable_to_non_nullable
as NutritionPlan,trainingMenu: null == trainingMenu ? _self.trainingMenu : trainingMenu // ignore: cast_nullable_to_non_nullable
as TrainingMenu,
  ));
}

/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionPlanCopyWith<$Res> get nutritionPlan {
  
  return $NutritionPlanCopyWith<$Res>(_self.nutritionPlan, (value) {
    return _then(_self.copyWith(nutritionPlan: value));
  });
}/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingMenuCopyWith<$Res> get trainingMenu {
  
  return $TrainingMenuCopyWith<$Res>(_self.trainingMenu, (value) {
    return _then(_self.copyWith(trainingMenu: value));
  });
}
}

// dart format on
