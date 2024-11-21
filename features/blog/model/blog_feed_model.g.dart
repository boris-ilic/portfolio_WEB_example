// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlogFeedModelListImpl _$$BlogFeedModelListImplFromJson(
        Map<String, dynamic> json) =>
    _$BlogFeedModelListImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => BlogFeedModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BlogFeedModelListImplToJson(
        _$BlogFeedModelListImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$BlogFeedModelImpl _$$BlogFeedModelImplFromJson(Map<String, dynamic> json) =>
    _$BlogFeedModelImpl(
      title: json['title'] as String? ?? "",
      link: json['link'] as String? ?? "",
      description: json['description'] as String? ?? "",
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BlogFeedModelImplToJson(_$BlogFeedModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'description': instance.description,
      'categories': instance.categories,
    };
