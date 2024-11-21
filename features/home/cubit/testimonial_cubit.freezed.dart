// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'testimonial_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TestimonialState {
  List<TestimonialModel> get items => throw _privateConstructorUsedError;

  /// Create a copy of TestimonialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestimonialStateCopyWith<TestimonialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestimonialStateCopyWith<$Res> {
  factory $TestimonialStateCopyWith(
          TestimonialState value, $Res Function(TestimonialState) then) =
      _$TestimonialStateCopyWithImpl<$Res, TestimonialState>;
  @useResult
  $Res call({List<TestimonialModel> items});
}

/// @nodoc
class _$TestimonialStateCopyWithImpl<$Res, $Val extends TestimonialState>
    implements $TestimonialStateCopyWith<$Res> {
  _$TestimonialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestimonialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TestimonialModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestimonialStateImplCopyWith<$Res>
    implements $TestimonialStateCopyWith<$Res> {
  factory _$$TestimonialStateImplCopyWith(_$TestimonialStateImpl value,
          $Res Function(_$TestimonialStateImpl) then) =
      __$$TestimonialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TestimonialModel> items});
}

/// @nodoc
class __$$TestimonialStateImplCopyWithImpl<$Res>
    extends _$TestimonialStateCopyWithImpl<$Res, _$TestimonialStateImpl>
    implements _$$TestimonialStateImplCopyWith<$Res> {
  __$$TestimonialStateImplCopyWithImpl(_$TestimonialStateImpl _value,
      $Res Function(_$TestimonialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestimonialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$TestimonialStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TestimonialModel>,
    ));
  }
}

/// @nodoc

class _$TestimonialStateImpl implements _TestimonialState {
  const _$TestimonialStateImpl({final List<TestimonialModel> items = const []})
      : _items = items;

  final List<TestimonialModel> _items;
  @override
  @JsonKey()
  List<TestimonialModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'TestimonialState(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestimonialStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of TestimonialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestimonialStateImplCopyWith<_$TestimonialStateImpl> get copyWith =>
      __$$TestimonialStateImplCopyWithImpl<_$TestimonialStateImpl>(
          this, _$identity);
}

abstract class _TestimonialState implements TestimonialState {
  const factory _TestimonialState({final List<TestimonialModel> items}) =
      _$TestimonialStateImpl;

  @override
  List<TestimonialModel> get items;

  /// Create a copy of TestimonialState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestimonialStateImplCopyWith<_$TestimonialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
