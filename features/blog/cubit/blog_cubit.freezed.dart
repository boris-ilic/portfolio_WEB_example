// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlogState {
  List<BlogFeedModel> get items => throw _privateConstructorUsedError;

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlogStateCopyWith<BlogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogStateCopyWith<$Res> {
  factory $BlogStateCopyWith(BlogState value, $Res Function(BlogState) then) =
      _$BlogStateCopyWithImpl<$Res, BlogState>;
  @useResult
  $Res call({List<BlogFeedModel> items});
}

/// @nodoc
class _$BlogStateCopyWithImpl<$Res, $Val extends BlogState>
    implements $BlogStateCopyWith<$Res> {
  _$BlogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlogState
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
              as List<BlogFeedModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogStateModelImplCopyWith<$Res>
    implements $BlogStateCopyWith<$Res> {
  factory _$$BlogStateModelImplCopyWith(_$BlogStateModelImpl value,
          $Res Function(_$BlogStateModelImpl) then) =
      __$$BlogStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BlogFeedModel> items});
}

/// @nodoc
class __$$BlogStateModelImplCopyWithImpl<$Res>
    extends _$BlogStateCopyWithImpl<$Res, _$BlogStateModelImpl>
    implements _$$BlogStateModelImplCopyWith<$Res> {
  __$$BlogStateModelImplCopyWithImpl(
      _$BlogStateModelImpl _value, $Res Function(_$BlogStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$BlogStateModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BlogFeedModel>,
    ));
  }
}

/// @nodoc

class _$BlogStateModelImpl implements _BlogStateModel {
  const _$BlogStateModelImpl({final List<BlogFeedModel> items = const []})
      : _items = items;

  final List<BlogFeedModel> _items;
  @override
  @JsonKey()
  List<BlogFeedModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'BlogState(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogStateModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogStateModelImplCopyWith<_$BlogStateModelImpl> get copyWith =>
      __$$BlogStateModelImplCopyWithImpl<_$BlogStateModelImpl>(
          this, _$identity);
}

abstract class _BlogStateModel implements BlogState {
  const factory _BlogStateModel({final List<BlogFeedModel> items}) =
      _$BlogStateModelImpl;

  @override
  List<BlogFeedModel> get items;

  /// Create a copy of BlogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogStateModelImplCopyWith<_$BlogStateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
