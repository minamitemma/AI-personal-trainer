// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingMenu {

// 🚨 修正: required を削除し @Default('') を追加
 String get title; String get duration; List<DailyWorkout> get workouts;
/// Create a copy of TrainingMenu
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingMenuCopyWith<TrainingMenu> get copyWith => _$TrainingMenuCopyWithImpl<TrainingMenu>(this as TrainingMenu, _$identity);

  /// Serializes this TrainingMenu to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingMenu&&(identical(other.title, title) || other.title == title)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.workouts, workouts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,duration,const DeepCollectionEquality().hash(workouts));

@override
String toString() {
  return 'TrainingMenu(title: $title, duration: $duration, workouts: $workouts)';
}


}

/// @nodoc
abstract mixin class $TrainingMenuCopyWith<$Res>  {
  factory $TrainingMenuCopyWith(TrainingMenu value, $Res Function(TrainingMenu) _then) = _$TrainingMenuCopyWithImpl;
@useResult
$Res call({
 String title, String duration, List<DailyWorkout> workouts
});




}
/// @nodoc
class _$TrainingMenuCopyWithImpl<$Res>
    implements $TrainingMenuCopyWith<$Res> {
  _$TrainingMenuCopyWithImpl(this._self, this._then);

  final TrainingMenu _self;
  final $Res Function(TrainingMenu) _then;

/// Create a copy of TrainingMenu
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? duration = null,Object? workouts = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,workouts: null == workouts ? _self.workouts : workouts // ignore: cast_nullable_to_non_nullable
as List<DailyWorkout>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingMenu].
extension TrainingMenuPatterns on TrainingMenu {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingMenu value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingMenu() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingMenu value)  $default,){
final _that = this;
switch (_that) {
case _TrainingMenu():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingMenu value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingMenu() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String duration,  List<DailyWorkout> workouts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingMenu() when $default != null:
return $default(_that.title,_that.duration,_that.workouts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String duration,  List<DailyWorkout> workouts)  $default,) {final _that = this;
switch (_that) {
case _TrainingMenu():
return $default(_that.title,_that.duration,_that.workouts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String duration,  List<DailyWorkout> workouts)?  $default,) {final _that = this;
switch (_that) {
case _TrainingMenu() when $default != null:
return $default(_that.title,_that.duration,_that.workouts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingMenu implements TrainingMenu {
  const _TrainingMenu({this.title = '', this.duration = '', final  List<DailyWorkout> workouts = const []}): _workouts = workouts;
  factory _TrainingMenu.fromJson(Map<String, dynamic> json) => _$TrainingMenuFromJson(json);

// 🚨 修正: required を削除し @Default('') を追加
@override@JsonKey() final  String title;
@override@JsonKey() final  String duration;
 final  List<DailyWorkout> _workouts;
@override@JsonKey() List<DailyWorkout> get workouts {
  if (_workouts is EqualUnmodifiableListView) return _workouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workouts);
}


/// Create a copy of TrainingMenu
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingMenuCopyWith<_TrainingMenu> get copyWith => __$TrainingMenuCopyWithImpl<_TrainingMenu>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingMenuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingMenu&&(identical(other.title, title) || other.title == title)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other._workouts, _workouts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,duration,const DeepCollectionEquality().hash(_workouts));

@override
String toString() {
  return 'TrainingMenu(title: $title, duration: $duration, workouts: $workouts)';
}


}

/// @nodoc
abstract mixin class _$TrainingMenuCopyWith<$Res> implements $TrainingMenuCopyWith<$Res> {
  factory _$TrainingMenuCopyWith(_TrainingMenu value, $Res Function(_TrainingMenu) _then) = __$TrainingMenuCopyWithImpl;
@override @useResult
$Res call({
 String title, String duration, List<DailyWorkout> workouts
});




}
/// @nodoc
class __$TrainingMenuCopyWithImpl<$Res>
    implements _$TrainingMenuCopyWith<$Res> {
  __$TrainingMenuCopyWithImpl(this._self, this._then);

  final _TrainingMenu _self;
  final $Res Function(_TrainingMenu) _then;

/// Create a copy of TrainingMenu
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? duration = null,Object? workouts = null,}) {
  return _then(_TrainingMenu(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,workouts: null == workouts ? _self._workouts : workouts // ignore: cast_nullable_to_non_nullable
as List<DailyWorkout>,
  ));
}


}


/// @nodoc
mixin _$DailyWorkout {

 String get day; String get focus;// 🚨 修正: Nullまたは欠落の場合に空のリストを使用する 🚨
 List<Exercise> get exercises;
/// Create a copy of DailyWorkout
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyWorkoutCopyWith<DailyWorkout> get copyWith => _$DailyWorkoutCopyWithImpl<DailyWorkout>(this as DailyWorkout, _$identity);

  /// Serializes this DailyWorkout to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyWorkout&&(identical(other.day, day) || other.day == day)&&(identical(other.focus, focus) || other.focus == focus)&&const DeepCollectionEquality().equals(other.exercises, exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,focus,const DeepCollectionEquality().hash(exercises));

@override
String toString() {
  return 'DailyWorkout(day: $day, focus: $focus, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class $DailyWorkoutCopyWith<$Res>  {
  factory $DailyWorkoutCopyWith(DailyWorkout value, $Res Function(DailyWorkout) _then) = _$DailyWorkoutCopyWithImpl;
@useResult
$Res call({
 String day, String focus, List<Exercise> exercises
});




}
/// @nodoc
class _$DailyWorkoutCopyWithImpl<$Res>
    implements $DailyWorkoutCopyWith<$Res> {
  _$DailyWorkoutCopyWithImpl(this._self, this._then);

  final DailyWorkout _self;
  final $Res Function(DailyWorkout) _then;

/// Create a copy of DailyWorkout
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? focus = null,Object? exercises = null,}) {
  return _then(_self.copyWith(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<Exercise>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyWorkout].
extension DailyWorkoutPatterns on DailyWorkout {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyWorkout value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyWorkout() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyWorkout value)  $default,){
final _that = this;
switch (_that) {
case _DailyWorkout():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyWorkout value)?  $default,){
final _that = this;
switch (_that) {
case _DailyWorkout() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String day,  String focus,  List<Exercise> exercises)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyWorkout() when $default != null:
return $default(_that.day,_that.focus,_that.exercises);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String day,  String focus,  List<Exercise> exercises)  $default,) {final _that = this;
switch (_that) {
case _DailyWorkout():
return $default(_that.day,_that.focus,_that.exercises);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String day,  String focus,  List<Exercise> exercises)?  $default,) {final _that = this;
switch (_that) {
case _DailyWorkout() when $default != null:
return $default(_that.day,_that.focus,_that.exercises);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyWorkout implements DailyWorkout {
  const _DailyWorkout({this.day = '', this.focus = '', final  List<Exercise> exercises = const []}): _exercises = exercises;
  factory _DailyWorkout.fromJson(Map<String, dynamic> json) => _$DailyWorkoutFromJson(json);

@override@JsonKey() final  String day;
@override@JsonKey() final  String focus;
// 🚨 修正: Nullまたは欠落の場合に空のリストを使用する 🚨
 final  List<Exercise> _exercises;
// 🚨 修正: Nullまたは欠落の場合に空のリストを使用する 🚨
@override@JsonKey() List<Exercise> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}


/// Create a copy of DailyWorkout
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyWorkoutCopyWith<_DailyWorkout> get copyWith => __$DailyWorkoutCopyWithImpl<_DailyWorkout>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyWorkoutToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyWorkout&&(identical(other.day, day) || other.day == day)&&(identical(other.focus, focus) || other.focus == focus)&&const DeepCollectionEquality().equals(other._exercises, _exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,focus,const DeepCollectionEquality().hash(_exercises));

@override
String toString() {
  return 'DailyWorkout(day: $day, focus: $focus, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class _$DailyWorkoutCopyWith<$Res> implements $DailyWorkoutCopyWith<$Res> {
  factory _$DailyWorkoutCopyWith(_DailyWorkout value, $Res Function(_DailyWorkout) _then) = __$DailyWorkoutCopyWithImpl;
@override @useResult
$Res call({
 String day, String focus, List<Exercise> exercises
});




}
/// @nodoc
class __$DailyWorkoutCopyWithImpl<$Res>
    implements _$DailyWorkoutCopyWith<$Res> {
  __$DailyWorkoutCopyWithImpl(this._self, this._then);

  final _DailyWorkout _self;
  final $Res Function(_DailyWorkout) _then;

/// Create a copy of DailyWorkout
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? focus = null,Object? exercises = null,}) {
  return _then(_DailyWorkout(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<Exercise>,
  ));
}


}


/// @nodoc
mixin _$Exercise {

 String get name; int get sets;// intは0をデフォルトにするか、requiredのままにする
 String get repsOrDuration; String get rest; bool get isCompleted;
/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseCopyWith<Exercise> get copyWith => _$ExerciseCopyWithImpl<Exercise>(this as Exercise, _$identity);

  /// Serializes this Exercise to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Exercise&&(identical(other.name, name) || other.name == name)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.repsOrDuration, repsOrDuration) || other.repsOrDuration == repsOrDuration)&&(identical(other.rest, rest) || other.rest == rest)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sets,repsOrDuration,rest,isCompleted);

@override
String toString() {
  return 'Exercise(name: $name, sets: $sets, repsOrDuration: $repsOrDuration, rest: $rest, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $ExerciseCopyWith<$Res>  {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) _then) = _$ExerciseCopyWithImpl;
@useResult
$Res call({
 String name, int sets, String repsOrDuration, String rest, bool isCompleted
});




}
/// @nodoc
class _$ExerciseCopyWithImpl<$Res>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._self, this._then);

  final Exercise _self;
  final $Res Function(Exercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? sets = null,Object? repsOrDuration = null,Object? rest = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,repsOrDuration: null == repsOrDuration ? _self.repsOrDuration : repsOrDuration // ignore: cast_nullable_to_non_nullable
as String,rest: null == rest ? _self.rest : rest // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Exercise].
extension ExercisePatterns on Exercise {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Exercise value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Exercise() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Exercise value)  $default,){
final _that = this;
switch (_that) {
case _Exercise():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Exercise value)?  $default,){
final _that = this;
switch (_that) {
case _Exercise() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int sets,  String repsOrDuration,  String rest,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Exercise() when $default != null:
return $default(_that.name,_that.sets,_that.repsOrDuration,_that.rest,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int sets,  String repsOrDuration,  String rest,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _Exercise():
return $default(_that.name,_that.sets,_that.repsOrDuration,_that.rest,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int sets,  String repsOrDuration,  String rest,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _Exercise() when $default != null:
return $default(_that.name,_that.sets,_that.repsOrDuration,_that.rest,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Exercise implements Exercise {
  const _Exercise({this.name = '', this.sets = 0, this.repsOrDuration = '', this.rest = '', this.isCompleted = false});
  factory _Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  int sets;
// intは0をデフォルトにするか、requiredのままにする
@override@JsonKey() final  String repsOrDuration;
@override@JsonKey() final  String rest;
@override@JsonKey() final  bool isCompleted;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseCopyWith<_Exercise> get copyWith => __$ExerciseCopyWithImpl<_Exercise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Exercise&&(identical(other.name, name) || other.name == name)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.repsOrDuration, repsOrDuration) || other.repsOrDuration == repsOrDuration)&&(identical(other.rest, rest) || other.rest == rest)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sets,repsOrDuration,rest,isCompleted);

@override
String toString() {
  return 'Exercise(name: $name, sets: $sets, repsOrDuration: $repsOrDuration, rest: $rest, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$ExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory _$ExerciseCopyWith(_Exercise value, $Res Function(_Exercise) _then) = __$ExerciseCopyWithImpl;
@override @useResult
$Res call({
 String name, int sets, String repsOrDuration, String rest, bool isCompleted
});




}
/// @nodoc
class __$ExerciseCopyWithImpl<$Res>
    implements _$ExerciseCopyWith<$Res> {
  __$ExerciseCopyWithImpl(this._self, this._then);

  final _Exercise _self;
  final $Res Function(_Exercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? sets = null,Object? repsOrDuration = null,Object? rest = null,Object? isCompleted = null,}) {
  return _then(_Exercise(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,repsOrDuration: null == repsOrDuration ? _self.repsOrDuration : repsOrDuration // ignore: cast_nullable_to_non_nullable
as String,rest: null == rest ? _self.rest : rest // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
