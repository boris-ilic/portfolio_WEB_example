// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlogFeedModelList _$BlogFeedModelListFromJson(Map<String, dynamic> json) {
  return _BlogFeedModelList.fromJson(json);
}

/// @nodoc
mixin _$BlogFeedModelList {
  List<BlogFeedModel> get items => throw _privateConstructorUsedError;

  /// Serializes this BlogFeedModelList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlogFeedModelList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlogFeedModelListCopyWith<BlogFeedModelList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogFeedModelListCopyWith<$Res> {
  factory $BlogFeedModelListCopyWith(
          BlogFeedModelList value, $Res Function(BlogFeedModelList) then) =
      _$BlogFeedModelListCopyWithImpl<$Res, BlogFeedModelList>;
  @useResult
  $Res call({List<BlogFeedModel> items});
}

/// @nodoc
class _$BlogFeedModelListCopyWithImpl<$Res, $Val extends BlogFeedModelList>
    implements $BlogFeedModelListCopyWith<$Res> {
  _$BlogFeedModelListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlogFeedModelList
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
abstract class _$$BlogFeedModelListImplCopyWith<$Res>
    implements $BlogFeedModelListCopyWith<$Res> {
  factory _$$BlogFeedModelListImplCopyWith(_$BlogFeedModelListImpl value,
          $Res Function(_$BlogFeedModelListImpl) then) =
      __$$BlogFeedModelListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BlogFeedModel> items});
}

/// @nodoc
class __$$BlogFeedModelListImplCopyWithImpl<$Res>
    extends _$BlogFeedModelListCopyWithImpl<$Res, _$BlogFeedModelListImpl>
    implements _$$BlogFeedModelListImplCopyWith<$Res> {
  __$$BlogFeedModelListImplCopyWithImpl(_$BlogFeedModelListImpl _value,
      $Res Function(_$BlogFeedModelListImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogFeedModelList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$BlogFeedModelListImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BlogFeedModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlogFeedModelListImpl implements _BlogFeedModelList {
  const _$BlogFeedModelListImpl({final List<BlogFeedModel> items = const []})
      : _items = items;

  factory _$BlogFeedModelListImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogFeedModelListImplFromJson(json);

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
    return 'BlogFeedModelList(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogFeedModelListImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of BlogFeedModelList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogFeedModelListImplCopyWith<_$BlogFeedModelListImpl> get copyWith =>
      __$$BlogFeedModelListImplCopyWithImpl<_$BlogFeedModelListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogFeedModelListImplToJson(
      this,
    );
  }
}

abstract class _BlogFeedModelList implements BlogFeedModelList {
  const factory _BlogFeedModelList({final List<BlogFeedModel> items}) =
      _$BlogFeedModelListImpl;

  factory _BlogFeedModelList.fromJson(Map<String, dynamic> json) =
      _$BlogFeedModelListImpl.fromJson;

  @override
  List<BlogFeedModel> get items;

  /// Create a copy of BlogFeedModelList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogFeedModelListImplCopyWith<_$BlogFeedModelListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlogFeedModel _$BlogFeedModelFromJson(Map<String, dynamic> json) {
  return _BlogFeedModel.fromJson(json);
}

/// @nodoc
mixin _$BlogFeedModel {
  String get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;

  /// Serializes this BlogFeedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlogFeedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlogFeedModelCopyWith<BlogFeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogFeedModelCopyWith<$Res> {
  factory $BlogFeedModelCopyWith(
          BlogFeedModel value, $Res Function(BlogFeedModel) then) =
      _$BlogFeedModelCopyWithImpl<$Res, BlogFeedModel>;
  @useResult
  $Res call(
      {String title, String link, String description, List<String> categories});
}

/// @nodoc
class _$BlogFeedModelCopyWithImpl<$Res, $Val extends BlogFeedModel>
    implements $BlogFeedModelCopyWith<$Res> {
  _$BlogFeedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlogFeedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? link = null,
    Object? description = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogFeedModelImplCopyWith<$Res>
    implements $BlogFeedModelCopyWith<$Res> {
  factory _$$BlogFeedModelImplCopyWith(
          _$BlogFeedModelImpl value, $Res Function(_$BlogFeedModelImpl) then) =
      __$$BlogFeedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String link, String description, List<String> categories});
}

/// @nodoc
class __$$BlogFeedModelImplCopyWithImpl<$Res>
    extends _$BlogFeedModelCopyWithImpl<$Res, _$BlogFeedModelImpl>
    implements _$$BlogFeedModelImplCopyWith<$Res> {
  __$$BlogFeedModelImplCopyWithImpl(
      _$BlogFeedModelImpl _value, $Res Function(_$BlogFeedModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogFeedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? link = null,
    Object? description = null,
    Object? categories = null,
  }) {
    return _then(_$BlogFeedModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlogFeedModelImpl extends _BlogFeedModel {
  const _$BlogFeedModelImpl(
      {this.title = "",
      this.link = "",
      this.description = "",
      final List<String> categories = const []})
      : _categories = categories,
        super._();

  factory _$BlogFeedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogFeedModelImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String link;
  @override
  @JsonKey()
  final String description;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'BlogFeedModel(title: $title, link: $link, description: $description, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogFeedModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, link, description,
      const DeepCollectionEquality().hash(_categories));

  /// Create a copy of BlogFeedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogFeedModelImplCopyWith<_$BlogFeedModelImpl> get copyWith =>
      __$$BlogFeedModelImplCopyWithImpl<_$BlogFeedModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogFeedModelImplToJson(
      this,
    );
  }
}

abstract class _BlogFeedModel extends BlogFeedModel {
  const factory _BlogFeedModel(
      {final String title,
      final String link,
      final String description,
      final List<String> categories}) = _$BlogFeedModelImpl;
  const _BlogFeedModel._() : super._();

  factory _BlogFeedModel.fromJson(Map<String, dynamic> json) =
      _$BlogFeedModelImpl.fromJson;

  @override
  String get title;
  @override
  String get link;
  @override
  String get description;
  @override
  List<String> get categories;

  /// Create a copy of BlogFeedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogFeedModelImplCopyWith<_$BlogFeedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
