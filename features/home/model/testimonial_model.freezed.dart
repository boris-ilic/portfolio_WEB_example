// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'testimonial_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestimonialModel _$TestimonialModelFromJson(Map<String, dynamic> json) {
  return _TestimonialModel.fromJson(json);
}

/// @nodoc
mixin _$TestimonialModel {
  String get displayName => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;

  /// Serializes this TestimonialModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestimonialModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestimonialModelCopyWith<TestimonialModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestimonialModelCopyWith<$Res> {
  factory $TestimonialModelCopyWith(
          TestimonialModel value, $Res Function(TestimonialModel) then) =
      _$TestimonialModelCopyWithImpl<$Res, TestimonialModel>;
  @useResult
  $Res call(
      {String displayName,
      String avatar,
      String position,
      String recommendation});
}

/// @nodoc
class _$TestimonialModelCopyWithImpl<$Res, $Val extends TestimonialModel>
    implements $TestimonialModelCopyWith<$Res> {
  _$TestimonialModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestimonialModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? avatar = null,
    Object? position = null,
    Object? recommendation = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestimonialModelImplCopyWith<$Res>
    implements $TestimonialModelCopyWith<$Res> {
  factory _$$TestimonialModelImplCopyWith(_$TestimonialModelImpl value,
          $Res Function(_$TestimonialModelImpl) then) =
      __$$TestimonialModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String displayName,
      String avatar,
      String position,
      String recommendation});
}

/// @nodoc
class __$$TestimonialModelImplCopyWithImpl<$Res>
    extends _$TestimonialModelCopyWithImpl<$Res, _$TestimonialModelImpl>
    implements _$$TestimonialModelImplCopyWith<$Res> {
  __$$TestimonialModelImplCopyWithImpl(_$TestimonialModelImpl _value,
      $Res Function(_$TestimonialModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestimonialModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? avatar = null,
    Object? position = null,
    Object? recommendation = null,
  }) {
    return _then(_$TestimonialModelImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestimonialModelImpl implements _TestimonialModel {
  const _$TestimonialModelImpl(
      {this.displayName = "",
      this.avatar = "",
      this.position = "",
      this.recommendation = ""});

  factory _$TestimonialModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestimonialModelImplFromJson(json);

  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final String avatar;
  @override
  @JsonKey()
  final String position;
  @override
  @JsonKey()
  final String recommendation;

  @override
  String toString() {
    return 'TestimonialModel(displayName: $displayName, avatar: $avatar, position: $position, recommendation: $recommendation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestimonialModelImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, displayName, avatar, position, recommendation);

  /// Create a copy of TestimonialModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestimonialModelImplCopyWith<_$TestimonialModelImpl> get copyWith =>
      __$$TestimonialModelImplCopyWithImpl<_$TestimonialModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestimonialModelImplToJson(
      this,
    );
  }
}

abstract class _TestimonialModel implements TestimonialModel {
  const factory _TestimonialModel(
      {final String displayName,
      final String avatar,
      final String position,
      final String recommendation}) = _$TestimonialModelImpl;

  factory _TestimonialModel.fromJson(Map<String, dynamic> json) =
      _$TestimonialModelImpl.fromJson;

  @override
  String get displayName;
  @override
  String get avatar;
  @override
  String get position;
  @override
  String get recommendation;

  /// Create a copy of TestimonialModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestimonialModelImplCopyWith<_$TestimonialModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
