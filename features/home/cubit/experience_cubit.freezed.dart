// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExperienceState {
  List<WorkExperienceModel> get workExperienceList =>
      throw _privateConstructorUsedError;
  List<ExperienceModel> get educationExperienceList =>
      throw _privateConstructorUsedError;

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExperienceStateCopyWith<ExperienceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceStateCopyWith<$Res> {
  factory $ExperienceStateCopyWith(
          ExperienceState value, $Res Function(ExperienceState) then) =
      _$ExperienceStateCopyWithImpl<$Res, ExperienceState>;
  @useResult
  $Res call(
      {List<WorkExperienceModel> workExperienceList,
      List<ExperienceModel> educationExperienceList});
}

/// @nodoc
class _$ExperienceStateCopyWithImpl<$Res, $Val extends ExperienceState>
    implements $ExperienceStateCopyWith<$Res> {
  _$ExperienceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workExperienceList = null,
    Object? educationExperienceList = null,
  }) {
    return _then(_value.copyWith(
      workExperienceList: null == workExperienceList
          ? _value.workExperienceList
          : workExperienceList // ignore: cast_nullable_to_non_nullable
              as List<WorkExperienceModel>,
      educationExperienceList: null == educationExperienceList
          ? _value.educationExperienceList
          : educationExperienceList // ignore: cast_nullable_to_non_nullable
              as List<ExperienceModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExperienceStateImplCopyWith<$Res>
    implements $ExperienceStateCopyWith<$Res> {
  factory _$$ExperienceStateImplCopyWith(_$ExperienceStateImpl value,
          $Res Function(_$ExperienceStateImpl) then) =
      __$$ExperienceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WorkExperienceModel> workExperienceList,
      List<ExperienceModel> educationExperienceList});
}

/// @nodoc
class __$$ExperienceStateImplCopyWithImpl<$Res>
    extends _$ExperienceStateCopyWithImpl<$Res, _$ExperienceStateImpl>
    implements _$$ExperienceStateImplCopyWith<$Res> {
  __$$ExperienceStateImplCopyWithImpl(
      _$ExperienceStateImpl _value, $Res Function(_$ExperienceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workExperienceList = null,
    Object? educationExperienceList = null,
  }) {
    return _then(_$ExperienceStateImpl(
      workExperienceList: null == workExperienceList
          ? _value._workExperienceList
          : workExperienceList // ignore: cast_nullable_to_non_nullable
              as List<WorkExperienceModel>,
      educationExperienceList: null == educationExperienceList
          ? _value._educationExperienceList
          : educationExperienceList // ignore: cast_nullable_to_non_nullable
              as List<ExperienceModel>,
    ));
  }
}

/// @nodoc

class _$ExperienceStateImpl implements _ExperienceState {
  const _$ExperienceStateImpl(
      {final List<WorkExperienceModel> workExperienceList = const [],
      final List<ExperienceModel> educationExperienceList = const []})
      : _workExperienceList = workExperienceList,
        _educationExperienceList = educationExperienceList;

  final List<WorkExperienceModel> _workExperienceList;
  @override
  @JsonKey()
  List<WorkExperienceModel> get workExperienceList {
    if (_workExperienceList is EqualUnmodifiableListView)
      return _workExperienceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workExperienceList);
  }

  final List<ExperienceModel> _educationExperienceList;
  @override
  @JsonKey()
  List<ExperienceModel> get educationExperienceList {
    if (_educationExperienceList is EqualUnmodifiableListView)
      return _educationExperienceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_educationExperienceList);
  }

  @override
  String toString() {
    return 'ExperienceState(workExperienceList: $workExperienceList, educationExperienceList: $educationExperienceList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceStateImpl &&
            const DeepCollectionEquality()
                .equals(other._workExperienceList, _workExperienceList) &&
            const DeepCollectionEquality().equals(
                other._educationExperienceList, _educationExperienceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_workExperienceList),
      const DeepCollectionEquality().hash(_educationExperienceList));

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperienceStateImplCopyWith<_$ExperienceStateImpl> get copyWith =>
      __$$ExperienceStateImplCopyWithImpl<_$ExperienceStateImpl>(
          this, _$identity);
}

abstract class _ExperienceState implements ExperienceState {
  const factory _ExperienceState(
          {final List<WorkExperienceModel> workExperienceList,
          final List<ExperienceModel> educationExperienceList}) =
      _$ExperienceStateImpl;

  @override
  List<WorkExperienceModel> get workExperienceList;
  @override
  List<ExperienceModel> get educationExperienceList;

  /// Create a copy of ExperienceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExperienceStateImplCopyWith<_$ExperienceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
