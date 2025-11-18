// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionPlan {

 String get goalSummary; String get duration; NutrientSummary get dailySummary; List<Meal> get meals; List<DietStatus> get weeklyAdherence;
/// Create a copy of NutritionPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionPlanCopyWith<NutritionPlan> get copyWith => _$NutritionPlanCopyWithImpl<NutritionPlan>(this as NutritionPlan, _$identity);

  /// Serializes this NutritionPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionPlan&&(identical(other.goalSummary, goalSummary) || other.goalSummary == goalSummary)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.dailySummary, dailySummary) || other.dailySummary == dailySummary)&&const DeepCollectionEquality().equals(other.meals, meals)&&const DeepCollectionEquality().equals(other.weeklyAdherence, weeklyAdherence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goalSummary,duration,dailySummary,const DeepCollectionEquality().hash(meals),const DeepCollectionEquality().hash(weeklyAdherence));

@override
String toString() {
  return 'NutritionPlan(goalSummary: $goalSummary, duration: $duration, dailySummary: $dailySummary, meals: $meals, weeklyAdherence: $weeklyAdherence)';
}


}

/// @nodoc
abstract mixin class $NutritionPlanCopyWith<$Res>  {
  factory $NutritionPlanCopyWith(NutritionPlan value, $Res Function(NutritionPlan) _then) = _$NutritionPlanCopyWithImpl;
@useResult
$Res call({
 String goalSummary, String duration, NutrientSummary dailySummary, List<Meal> meals, List<DietStatus> weeklyAdherence
});


$NutrientSummaryCopyWith<$Res> get dailySummary;

}
/// @nodoc
class _$NutritionPlanCopyWithImpl<$Res>
    implements $NutritionPlanCopyWith<$Res> {
  _$NutritionPlanCopyWithImpl(this._self, this._then);

  final NutritionPlan _self;
  final $Res Function(NutritionPlan) _then;

/// Create a copy of NutritionPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goalSummary = null,Object? duration = null,Object? dailySummary = null,Object? meals = null,Object? weeklyAdherence = null,}) {
  return _then(_self.copyWith(
goalSummary: null == goalSummary ? _self.goalSummary : goalSummary // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,dailySummary: null == dailySummary ? _self.dailySummary : dailySummary // ignore: cast_nullable_to_non_nullable
as NutrientSummary,meals: null == meals ? _self.meals : meals // ignore: cast_nullable_to_non_nullable
as List<Meal>,weeklyAdherence: null == weeklyAdherence ? _self.weeklyAdherence : weeklyAdherence // ignore: cast_nullable_to_non_nullable
as List<DietStatus>,
  ));
}
/// Create a copy of NutritionPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientSummaryCopyWith<$Res> get dailySummary {
  
  return $NutrientSummaryCopyWith<$Res>(_self.dailySummary, (value) {
    return _then(_self.copyWith(dailySummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutritionPlan].
extension NutritionPlanPatterns on NutritionPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionPlan value)  $default,){
final _that = this;
switch (_that) {
case _NutritionPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionPlan value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String goalSummary,  String duration,  NutrientSummary dailySummary,  List<Meal> meals,  List<DietStatus> weeklyAdherence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionPlan() when $default != null:
return $default(_that.goalSummary,_that.duration,_that.dailySummary,_that.meals,_that.weeklyAdherence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String goalSummary,  String duration,  NutrientSummary dailySummary,  List<Meal> meals,  List<DietStatus> weeklyAdherence)  $default,) {final _that = this;
switch (_that) {
case _NutritionPlan():
return $default(_that.goalSummary,_that.duration,_that.dailySummary,_that.meals,_that.weeklyAdherence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String goalSummary,  String duration,  NutrientSummary dailySummary,  List<Meal> meals,  List<DietStatus> weeklyAdherence)?  $default,) {final _that = this;
switch (_that) {
case _NutritionPlan() when $default != null:
return $default(_that.goalSummary,_that.duration,_that.dailySummary,_that.meals,_that.weeklyAdherence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutritionPlan implements NutritionPlan {
  const _NutritionPlan({this.goalSummary = '', this.duration = '', required this.dailySummary, final  List<Meal> meals = const [], final  List<DietStatus> weeklyAdherence = const [DietStatus.unknown, DietStatus.unknown, DietStatus.unknown, DietStatus.unknown, DietStatus.unknown, DietStatus.unknown, DietStatus.unknown]}): _meals = meals,_weeklyAdherence = weeklyAdherence;
  factory _NutritionPlan.fromJson(Map<String, dynamic> json) => _$NutritionPlanFromJson(json);

@override@JsonKey() final  String goalSummary;
@override@JsonKey() final  String duration;
@override final  NutrientSummary dailySummary;
 final  List<Meal> _meals;
@override@JsonKey() List<Meal> get meals {
  if (_meals is EqualUnmodifiableListView) return _meals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meals);
}

 final  List<DietStatus> _weeklyAdherence;
@override@JsonKey() List<DietStatus> get weeklyAdherence {
  if (_weeklyAdherence is EqualUnmodifiableListView) return _weeklyAdherence;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weeklyAdherence);
}


/// Create a copy of NutritionPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionPlanCopyWith<_NutritionPlan> get copyWith => __$NutritionPlanCopyWithImpl<_NutritionPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutritionPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionPlan&&(identical(other.goalSummary, goalSummary) || other.goalSummary == goalSummary)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.dailySummary, dailySummary) || other.dailySummary == dailySummary)&&const DeepCollectionEquality().equals(other._meals, _meals)&&const DeepCollectionEquality().equals(other._weeklyAdherence, _weeklyAdherence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goalSummary,duration,dailySummary,const DeepCollectionEquality().hash(_meals),const DeepCollectionEquality().hash(_weeklyAdherence));

@override
String toString() {
  return 'NutritionPlan(goalSummary: $goalSummary, duration: $duration, dailySummary: $dailySummary, meals: $meals, weeklyAdherence: $weeklyAdherence)';
}


}

/// @nodoc
abstract mixin class _$NutritionPlanCopyWith<$Res> implements $NutritionPlanCopyWith<$Res> {
  factory _$NutritionPlanCopyWith(_NutritionPlan value, $Res Function(_NutritionPlan) _then) = __$NutritionPlanCopyWithImpl;
@override @useResult
$Res call({
 String goalSummary, String duration, NutrientSummary dailySummary, List<Meal> meals, List<DietStatus> weeklyAdherence
});


@override $NutrientSummaryCopyWith<$Res> get dailySummary;

}
/// @nodoc
class __$NutritionPlanCopyWithImpl<$Res>
    implements _$NutritionPlanCopyWith<$Res> {
  __$NutritionPlanCopyWithImpl(this._self, this._then);

  final _NutritionPlan _self;
  final $Res Function(_NutritionPlan) _then;

/// Create a copy of NutritionPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goalSummary = null,Object? duration = null,Object? dailySummary = null,Object? meals = null,Object? weeklyAdherence = null,}) {
  return _then(_NutritionPlan(
goalSummary: null == goalSummary ? _self.goalSummary : goalSummary // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,dailySummary: null == dailySummary ? _self.dailySummary : dailySummary // ignore: cast_nullable_to_non_nullable
as NutrientSummary,meals: null == meals ? _self._meals : meals // ignore: cast_nullable_to_non_nullable
as List<Meal>,weeklyAdherence: null == weeklyAdherence ? _self._weeklyAdherence : weeklyAdherence // ignore: cast_nullable_to_non_nullable
as List<DietStatus>,
  ));
}

/// Create a copy of NutritionPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientSummaryCopyWith<$Res> get dailySummary {
  
  return $NutrientSummaryCopyWith<$Res>(_self.dailySummary, (value) {
    return _then(_self.copyWith(dailySummary: value));
  });
}
}


/// @nodoc
mixin _$Meal {

 String get type; String get time; String get description; NutrientSummary get mealNutrients; bool get isCompleted;
/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealCopyWith<Meal> get copyWith => _$MealCopyWithImpl<Meal>(this as Meal, _$identity);

  /// Serializes this Meal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Meal&&(identical(other.type, type) || other.type == type)&&(identical(other.time, time) || other.time == time)&&(identical(other.description, description) || other.description == description)&&(identical(other.mealNutrients, mealNutrients) || other.mealNutrients == mealNutrients)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,time,description,mealNutrients,isCompleted);

@override
String toString() {
  return 'Meal(type: $type, time: $time, description: $description, mealNutrients: $mealNutrients, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $MealCopyWith<$Res>  {
  factory $MealCopyWith(Meal value, $Res Function(Meal) _then) = _$MealCopyWithImpl;
@useResult
$Res call({
 String type, String time, String description, NutrientSummary mealNutrients, bool isCompleted
});


$NutrientSummaryCopyWith<$Res> get mealNutrients;

}
/// @nodoc
class _$MealCopyWithImpl<$Res>
    implements $MealCopyWith<$Res> {
  _$MealCopyWithImpl(this._self, this._then);

  final Meal _self;
  final $Res Function(Meal) _then;

/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? time = null,Object? description = null,Object? mealNutrients = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,mealNutrients: null == mealNutrients ? _self.mealNutrients : mealNutrients // ignore: cast_nullable_to_non_nullable
as NutrientSummary,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientSummaryCopyWith<$Res> get mealNutrients {
  
  return $NutrientSummaryCopyWith<$Res>(_self.mealNutrients, (value) {
    return _then(_self.copyWith(mealNutrients: value));
  });
}
}


/// Adds pattern-matching-related methods to [Meal].
extension MealPatterns on Meal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Meal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Meal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Meal value)  $default,){
final _that = this;
switch (_that) {
case _Meal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Meal value)?  $default,){
final _that = this;
switch (_that) {
case _Meal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String time,  String description,  NutrientSummary mealNutrients,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Meal() when $default != null:
return $default(_that.type,_that.time,_that.description,_that.mealNutrients,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String time,  String description,  NutrientSummary mealNutrients,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _Meal():
return $default(_that.type,_that.time,_that.description,_that.mealNutrients,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String time,  String description,  NutrientSummary mealNutrients,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _Meal() when $default != null:
return $default(_that.type,_that.time,_that.description,_that.mealNutrients,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Meal implements Meal {
  const _Meal({this.type = '', this.time = '', this.description = '', required this.mealNutrients, this.isCompleted = false});
  factory _Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

@override@JsonKey() final  String type;
@override@JsonKey() final  String time;
@override@JsonKey() final  String description;
@override final  NutrientSummary mealNutrients;
@override@JsonKey() final  bool isCompleted;

/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealCopyWith<_Meal> get copyWith => __$MealCopyWithImpl<_Meal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Meal&&(identical(other.type, type) || other.type == type)&&(identical(other.time, time) || other.time == time)&&(identical(other.description, description) || other.description == description)&&(identical(other.mealNutrients, mealNutrients) || other.mealNutrients == mealNutrients)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,time,description,mealNutrients,isCompleted);

@override
String toString() {
  return 'Meal(type: $type, time: $time, description: $description, mealNutrients: $mealNutrients, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$MealCopyWith<$Res> implements $MealCopyWith<$Res> {
  factory _$MealCopyWith(_Meal value, $Res Function(_Meal) _then) = __$MealCopyWithImpl;
@override @useResult
$Res call({
 String type, String time, String description, NutrientSummary mealNutrients, bool isCompleted
});


@override $NutrientSummaryCopyWith<$Res> get mealNutrients;

}
/// @nodoc
class __$MealCopyWithImpl<$Res>
    implements _$MealCopyWith<$Res> {
  __$MealCopyWithImpl(this._self, this._then);

  final _Meal _self;
  final $Res Function(_Meal) _then;

/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? time = null,Object? description = null,Object? mealNutrients = null,Object? isCompleted = null,}) {
  return _then(_Meal(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,mealNutrients: null == mealNutrients ? _self.mealNutrients : mealNutrients // ignore: cast_nullable_to_non_nullable
as NutrientSummary,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientSummaryCopyWith<$Res> get mealNutrients {
  
  return $NutrientSummaryCopyWith<$Res>(_self.mealNutrients, (value) {
    return _then(_self.copyWith(mealNutrients: value));
  });
}
}


/// @nodoc
mixin _$NutrientSummary {

 int get calories;@JsonKey(name: 'protein_g') int get proteinGrams;@JsonKey(name: 'fat_g') int get fatGrams;@JsonKey(name: 'carbs_g') int get carbsGrams;
/// Create a copy of NutrientSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientSummaryCopyWith<NutrientSummary> get copyWith => _$NutrientSummaryCopyWithImpl<NutrientSummary>(this as NutrientSummary, _$identity);

  /// Serializes this NutrientSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientSummary&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.proteinGrams, proteinGrams) || other.proteinGrams == proteinGrams)&&(identical(other.fatGrams, fatGrams) || other.fatGrams == fatGrams)&&(identical(other.carbsGrams, carbsGrams) || other.carbsGrams == carbsGrams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,proteinGrams,fatGrams,carbsGrams);

@override
String toString() {
  return 'NutrientSummary(calories: $calories, proteinGrams: $proteinGrams, fatGrams: $fatGrams, carbsGrams: $carbsGrams)';
}


}

/// @nodoc
abstract mixin class $NutrientSummaryCopyWith<$Res>  {
  factory $NutrientSummaryCopyWith(NutrientSummary value, $Res Function(NutrientSummary) _then) = _$NutrientSummaryCopyWithImpl;
@useResult
$Res call({
 int calories,@JsonKey(name: 'protein_g') int proteinGrams,@JsonKey(name: 'fat_g') int fatGrams,@JsonKey(name: 'carbs_g') int carbsGrams
});




}
/// @nodoc
class _$NutrientSummaryCopyWithImpl<$Res>
    implements $NutrientSummaryCopyWith<$Res> {
  _$NutrientSummaryCopyWithImpl(this._self, this._then);

  final NutrientSummary _self;
  final $Res Function(NutrientSummary) _then;

/// Create a copy of NutrientSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calories = null,Object? proteinGrams = null,Object? fatGrams = null,Object? carbsGrams = null,}) {
  return _then(_self.copyWith(
calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,proteinGrams: null == proteinGrams ? _self.proteinGrams : proteinGrams // ignore: cast_nullable_to_non_nullable
as int,fatGrams: null == fatGrams ? _self.fatGrams : fatGrams // ignore: cast_nullable_to_non_nullable
as int,carbsGrams: null == carbsGrams ? _self.carbsGrams : carbsGrams // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NutrientSummary].
extension NutrientSummaryPatterns on NutrientSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutrientSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutrientSummary value)  $default,){
final _that = this;
switch (_that) {
case _NutrientSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutrientSummary value)?  $default,){
final _that = this;
switch (_that) {
case _NutrientSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int calories, @JsonKey(name: 'protein_g')  int proteinGrams, @JsonKey(name: 'fat_g')  int fatGrams, @JsonKey(name: 'carbs_g')  int carbsGrams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientSummary() when $default != null:
return $default(_that.calories,_that.proteinGrams,_that.fatGrams,_that.carbsGrams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int calories, @JsonKey(name: 'protein_g')  int proteinGrams, @JsonKey(name: 'fat_g')  int fatGrams, @JsonKey(name: 'carbs_g')  int carbsGrams)  $default,) {final _that = this;
switch (_that) {
case _NutrientSummary():
return $default(_that.calories,_that.proteinGrams,_that.fatGrams,_that.carbsGrams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int calories, @JsonKey(name: 'protein_g')  int proteinGrams, @JsonKey(name: 'fat_g')  int fatGrams, @JsonKey(name: 'carbs_g')  int carbsGrams)?  $default,) {final _that = this;
switch (_that) {
case _NutrientSummary() when $default != null:
return $default(_that.calories,_that.proteinGrams,_that.fatGrams,_that.carbsGrams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutrientSummary implements NutrientSummary {
  const _NutrientSummary({this.calories = 0, @JsonKey(name: 'protein_g') this.proteinGrams = 0, @JsonKey(name: 'fat_g') this.fatGrams = 0, @JsonKey(name: 'carbs_g') this.carbsGrams = 0});
  factory _NutrientSummary.fromJson(Map<String, dynamic> json) => _$NutrientSummaryFromJson(json);

@override@JsonKey() final  int calories;
@override@JsonKey(name: 'protein_g') final  int proteinGrams;
@override@JsonKey(name: 'fat_g') final  int fatGrams;
@override@JsonKey(name: 'carbs_g') final  int carbsGrams;

/// Create a copy of NutrientSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientSummaryCopyWith<_NutrientSummary> get copyWith => __$NutrientSummaryCopyWithImpl<_NutrientSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutrientSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientSummary&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.proteinGrams, proteinGrams) || other.proteinGrams == proteinGrams)&&(identical(other.fatGrams, fatGrams) || other.fatGrams == fatGrams)&&(identical(other.carbsGrams, carbsGrams) || other.carbsGrams == carbsGrams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,proteinGrams,fatGrams,carbsGrams);

@override
String toString() {
  return 'NutrientSummary(calories: $calories, proteinGrams: $proteinGrams, fatGrams: $fatGrams, carbsGrams: $carbsGrams)';
}


}

/// @nodoc
abstract mixin class _$NutrientSummaryCopyWith<$Res> implements $NutrientSummaryCopyWith<$Res> {
  factory _$NutrientSummaryCopyWith(_NutrientSummary value, $Res Function(_NutrientSummary) _then) = __$NutrientSummaryCopyWithImpl;
@override @useResult
$Res call({
 int calories,@JsonKey(name: 'protein_g') int proteinGrams,@JsonKey(name: 'fat_g') int fatGrams,@JsonKey(name: 'carbs_g') int carbsGrams
});




}
/// @nodoc
class __$NutrientSummaryCopyWithImpl<$Res>
    implements _$NutrientSummaryCopyWith<$Res> {
  __$NutrientSummaryCopyWithImpl(this._self, this._then);

  final _NutrientSummary _self;
  final $Res Function(_NutrientSummary) _then;

/// Create a copy of NutrientSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calories = null,Object? proteinGrams = null,Object? fatGrams = null,Object? carbsGrams = null,}) {
  return _then(_NutrientSummary(
calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,proteinGrams: null == proteinGrams ? _self.proteinGrams : proteinGrams // ignore: cast_nullable_to_non_nullable
as int,fatGrams: null == fatGrams ? _self.fatGrams : fatGrams // ignore: cast_nullable_to_non_nullable
as int,carbsGrams: null == carbsGrams ? _self.carbsGrams : carbsGrams // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
