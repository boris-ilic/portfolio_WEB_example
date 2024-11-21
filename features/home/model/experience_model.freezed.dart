// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) {
  return _ExperienceModel.fromJson(json);
}

/// @nodoc
mixin _$ExperienceModel {
  String get title => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get responsibilities => throw _privateConstructorUsedError;
  List<String> get technologies => throw _privateConstructorUsedError;

  /// Serializes this ExperienceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExperienceModelCopyWith<ExperienceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceModelCopyWith<$Res> {
  factory $ExperienceModelCopyWith(
          ExperienceModel value, $Res Function(ExperienceModel) then) =
      _$ExperienceModelCopyWithImpl<$Res, ExperienceModel>;
  @useResult
  $Res call(
      {String title,
      String subTitle,
      String duration,
      String description,
      List<String> responsibilities,
      List<String> technologies});
}

/// @nodoc
class _$ExperienceModelCopyWithImpl<$Res, $Val extends ExperienceModel>
    implements $ExperienceModelCopyWith<$Res> {
  _$ExperienceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subTitle = null,
    Object? duration = null,
    Object? description = null,
    Object? responsibilities = null,
    Object? technologies = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      responsibilities: null == responsibilities
          ? _value.responsibilities
          : responsibilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      technologies: null == technologies
          ? _value.technologies
          : technologies // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExperienceModelImplCopyWith<$Res>
    implements $ExperienceModelCopyWith<$Res> {
  factory _$$ExperienceModelImplCopyWith(_$ExperienceModelImpl value,
          $Res Function(_$ExperienceModelImpl) then) =
      __$$ExperienceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String subTitle,
      String duration,
      String description,
      List<String> responsibilities,
      List<String> technologies});
}

/// @nodoc
class __$$ExperienceModelImplCopyWithImpl<$Res>
    extends _$ExperienceModelCopyWithImpl<$Res, _$ExperienceModelImpl>
    implements _$$ExperienceModelImplCopyWith<$Res> {
  __$$ExperienceModelImplCopyWithImpl(
      _$ExperienceModelImpl _value, $Res Function(_$ExperienceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subTitle = null,
    Object? duration = null,
    Object? description = null,
    Object? responsibilities = null,
    Object? technologies = null,
  }) {
    return _then(_$ExperienceModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      responsibilities: null == responsibilities
          ? _value._responsibilities
          : responsibilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      technologies: null == technologies
          ? _value._technologies
          : technologies // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperienceModelImpl implements _ExperienceModel {
  const _$ExperienceModelImpl(
      {required this.title,
      required this.subTitle,
      required this.duration,
      required this.description,
      required final List<String> responsibilities,
      required final List<String> technologies})
      : _responsibilities = responsibilities,
        _technologies = technologies;

  factory _$ExperienceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperienceModelImplFromJson(json);

  @override
  final String title;
  @override
  final String subTitle;
  @override
  final String duration;
  @override
  final String description;
  final List<String> _responsibilities;
  @override
  List<String> get responsibilities {
    if (_responsibilities is EqualUnmodifiableListView)
      return _responsibilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responsibilities);
  }

  final List<String> _technologies;
  @override
  List<String> get technologies {
    if (_technologies is EqualUnmodifiableListView) return _technologies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_technologies);
  }

  @override
  String toString() {
    return 'ExperienceModel(title: $title, subTitle: $subTitle, duration: $duration, description: $description, responsibilities: $responsibilities, technologies: $technologies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._responsibilities, _responsibilities) &&
            const DeepCollectionEquality()
                .equals(other._technologies, _technologies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      subTitle,
      duration,
      description,
      const DeepCollectionEquality().hash(_responsibilities),
      const DeepCollectionEquality().hash(_technologies));

  /// Create a copy of ExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperienceModelImplCopyWith<_$ExperienceModelImpl> get copyWith =>
      __$$ExperienceModelImplCopyWithImpl<_$ExperienceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExperienceModelImplToJson(
      this,
    );
  }
}

abstract class _ExperienceModel implements ExperienceModel {
  const factory _ExperienceModel(
      {required final String title,
      required final String subTitle,
      required final String duration,
      required final String description,
      required final List<String> responsibilities,
      required final List<String> technologies}) = _$ExperienceModelImpl;

  factory _ExperienceModel.fromJson(Map<String, dynamic> json) =
      _$ExperienceModelImpl.fromJson;

  @override
  String get title;
  @override
  String get subTitle;
  @override
  String get duration;
  @override
  String get description;
  @override
  List<String> get responsibilities;
  @override
  List<String> get technologies;

  /// Create a copy of ExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExperienceModelImplCopyWith<_$ExperienceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
