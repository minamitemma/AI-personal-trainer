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

 NutritionPlan get nutritionPlan; TrainingMenu get trainingMenu; DateTime get createdAt; UserInput get inputData;
/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanResultCopyWith<PlanResult> get copyWith => _$PlanResultCopyWithImpl<PlanResult>(this as PlanResult, _$identity);

  /// Serializes this PlanResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanResult&&(identical(other.nutritionPlan, nutritionPlan) || other.nutritionPlan == nutritionPlan)&&(identical(other.trainingMenu, trainingMenu) || other.trainingMenu == trainingMenu)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.inputData, inputData) || other.inputData == inputData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nutritionPlan,trainingMenu,createdAt,inputData);

@override
String toString() {
  return 'PlanResult(nutritionPlan: $nutritionPlan, trainingMenu: $trainingMenu, createdAt: $createdAt, inputData: $inputData)';
}


}

/// @nodoc
abstract mixin class $PlanResultCopyWith<$Res>  {
  factory $PlanResultCopyWith(PlanResult value, $Res Function(PlanResult) _then) = _$PlanResultCopyWithImpl;
@useResult
$Res call({
 NutritionPlan nutritionPlan, TrainingMenu trainingMenu, DateTime createdAt, UserInput inputData
});


$NutritionPlanCopyWith<$Res> get nutritionPlan;$TrainingMenuCopyWith<$Res> get trainingMenu;$UserInputCopyWith<$Res> get inputData;

}
/// @nodoc
class _$PlanResultCopyWithImpl<$Res>
    implements $PlanResultCopyWith<$Res> {
  _$PlanResultCopyWithImpl(this._self, this._then);

  final PlanResult _self;
  final $Res Function(PlanResult) _then;

/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nutritionPlan = null,Object? trainingMenu = null,Object? createdAt = null,Object? inputData = null,}) {
  return _then(_self.copyWith(
nutritionPlan: null == nutritionPlan ? _self.nutritionPlan : nutritionPlan // ignore: cast_nullable_to_non_nullable
as NutritionPlan,trainingMenu: null == trainingMenu ? _self.trainingMenu : trainingMenu // ignore: cast_nullable_to_non_nullable
as TrainingMenu,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,inputData: null == inputData ? _self.inputData : inputData // ignore: cast_nullable_to_non_nullable
as UserInput,
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
}/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInputCopyWith<$Res> get inputData {
  
  return $UserInputCopyWith<$Res>(_self.inputData, (value) {
    return _then(_self.copyWith(inputData: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NutritionPlan nutritionPlan,  TrainingMenu trainingMenu,  DateTime createdAt,  UserInput inputData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanResult() when $default != null:
return $default(_that.nutritionPlan,_that.trainingMenu,_that.createdAt,_that.inputData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NutritionPlan nutritionPlan,  TrainingMenu trainingMenu,  DateTime createdAt,  UserInput inputData)  $default,) {final _that = this;
switch (_that) {
case _PlanResult():
return $default(_that.nutritionPlan,_that.trainingMenu,_that.createdAt,_that.inputData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NutritionPlan nutritionPlan,  TrainingMenu trainingMenu,  DateTime createdAt,  UserInput inputData)?  $default,) {final _that = this;
switch (_that) {
case _PlanResult() when $default != null:
return $default(_that.nutritionPlan,_that.trainingMenu,_that.createdAt,_that.inputData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanResult implements PlanResult {
  const _PlanResult({required this.nutritionPlan, required this.trainingMenu, required this.createdAt, required this.inputData});
  factory _PlanResult.fromJson(Map<String, dynamic> json) => _$PlanResultFromJson(json);

@override final  NutritionPlan nutritionPlan;
@override final  TrainingMenu trainingMenu;
@override final  DateTime createdAt;
@override final  UserInput inputData;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanResult&&(identical(other.nutritionPlan, nutritionPlan) || other.nutritionPlan == nutritionPlan)&&(identical(other.trainingMenu, trainingMenu) || other.trainingMenu == trainingMenu)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.inputData, inputData) || other.inputData == inputData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nutritionPlan,trainingMenu,createdAt,inputData);

@override
String toString() {
  return 'PlanResult(nutritionPlan: $nutritionPlan, trainingMenu: $trainingMenu, createdAt: $createdAt, inputData: $inputData)';
}


}

/// @nodoc
abstract mixin class _$PlanResultCopyWith<$Res> implements $PlanResultCopyWith<$Res> {
  factory _$PlanResultCopyWith(_PlanResult value, $Res Function(_PlanResult) _then) = __$PlanResultCopyWithImpl;
@override @useResult
$Res call({
 NutritionPlan nutritionPlan, TrainingMenu trainingMenu, DateTime createdAt, UserInput inputData
});


@override $NutritionPlanCopyWith<$Res> get nutritionPlan;@override $TrainingMenuCopyWith<$Res> get trainingMenu;@override $UserInputCopyWith<$Res> get inputData;

}
/// @nodoc
class __$PlanResultCopyWithImpl<$Res>
    implements _$PlanResultCopyWith<$Res> {
  __$PlanResultCopyWithImpl(this._self, this._then);

  final _PlanResult _self;
  final $Res Function(_PlanResult) _then;

/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nutritionPlan = null,Object? trainingMenu = null,Object? createdAt = null,Object? inputData = null,}) {
  return _then(_PlanResult(
nutritionPlan: null == nutritionPlan ? _self.nutritionPlan : nutritionPlan // ignore: cast_nullable_to_non_nullable
as NutritionPlan,trainingMenu: null == trainingMenu ? _self.trainingMenu : trainingMenu // ignore: cast_nullable_to_non_nullable
as TrainingMenu,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,inputData: null == inputData ? _self.inputData : inputData // ignore: cast_nullable_to_non_nullable
as UserInput,
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
}/// Create a copy of PlanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInputCopyWith<$Res> get inputData {
  
  return $UserInputCopyWith<$Res>(_self.inputData, (value) {
    return _then(_self.copyWith(inputData: value));
  });
}
}

// dart format on
