// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AboutDetailState {
  AboutDetailModel get aboutDetailModel => throw _privateConstructorUsedError;

  /// Create a copy of AboutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AboutDetailStateCopyWith<AboutDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutDetailStateCopyWith<$Res> {
  factory $AboutDetailStateCopyWith(
          AboutDetailState value, $Res Function(AboutDetailState) then) =
      _$AboutDetailStateCopyWithImpl<$Res, AboutDetailState>;
  @useResult
  $Res call({AboutDetailModel aboutDetailModel});

  $AboutDetailModelCopyWith<$Res> get aboutDetailModel;
}

/// @nodoc
class _$AboutDetailStateCopyWithImpl<$Res, $Val extends AboutDetailState>
    implements $AboutDetailStateCopyWith<$Res> {
  _$AboutDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aboutDetailModel = null,
  }) {
    return _then(_value.copyWith(
      aboutDetailModel: null == aboutDetailModel
          ? _value.aboutDetailModel
          : aboutDetailModel // ignore: cast_nullable_to_non_nullable
              as AboutDetailModel,
    ) as $Val);
  }

  /// Create a copy of AboutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AboutDetailModelCopyWith<$Res> get aboutDetailModel {
    return $AboutDetailModelCopyWith<$Res>(_value.aboutDetailModel, (value) {
      return _then(_value.copyWith(aboutDetailModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AboutDetailStateImplCopyWith<$Res>
    implements $AboutDetailStateCopyWith<$Res> {
  factory _$$AboutDetailStateImplCopyWith(_$AboutDetailStateImpl value,
          $Res Function(_$AboutDetailStateImpl) then) =
      __$$AboutDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AboutDetailModel aboutDetailModel});

  @override
  $AboutDetailModelCopyWith<$Res> get aboutDetailModel;
}

/// @nodoc
class __$$AboutDetailStateImplCopyWithImpl<$Res>
    extends _$AboutDetailStateCopyWithImpl<$Res, _$AboutDetailStateImpl>
    implements _$$AboutDetailStateImplCopyWith<$Res> {
  __$$AboutDetailStateImplCopyWithImpl(_$AboutDetailStateImpl _value,
      $Res Function(_$AboutDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aboutDetailModel = null,
  }) {
    return _then(_$AboutDetailStateImpl(
      aboutDetailModel: null == aboutDetailModel
          ? _value.aboutDetailModel
          : aboutDetailModel // ignore: cast_nullable_to_non_nullable
              as AboutDetailModel,
    ));
  }
}

/// @nodoc

class _$AboutDetailStateImpl implements _AboutDetailState {
  const _$AboutDetailStateImpl(
      {this.aboutDetailModel = const AboutDetailModel()});

  @override
  @JsonKey()
  final AboutDetailModel aboutDetailModel;

  @override
  String toString() {
    return 'AboutDetailState(aboutDetailModel: $aboutDetailModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutDetailStateImpl &&
            (identical(other.aboutDetailModel, aboutDetailModel) ||
                other.aboutDetailModel == aboutDetailModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, aboutDetailModel);

  /// Create a copy of AboutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutDetailStateImplCopyWith<_$AboutDetailStateImpl> get copyWith =>
      __$$AboutDetailStateImplCopyWithImpl<_$AboutDetailStateImpl>(
          this, _$identity);
}

abstract class _AboutDetailState implements AboutDetailState {
  const factory _AboutDetailState({final AboutDetailModel aboutDetailModel}) =
      _$AboutDetailStateImpl;

  @override
  AboutDetailModel get aboutDetailModel;

  /// Create a copy of AboutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutDetailStateImplCopyWith<_$AboutDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
