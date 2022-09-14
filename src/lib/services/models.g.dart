// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeVideo _$YoutubeVideoFromJson(Map<String, dynamic> json) => YoutubeVideo(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      key: json['key'] as String? ?? '',
      published_at: json['published_at'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      thumbnail_2x: json['thumbnail_2x'] as String? ?? '',
      thumbnail_3x: json['thumbnail_3x'] as String? ?? '',
    );

Map<String, dynamic> _$YoutubeVideoToJson(YoutubeVideo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'key': instance.key,
      'published_at': instance.published_at,
      'thumbnail': instance.thumbnail,
      'thumbnail_2x': instance.thumbnail_2x,
      'thumbnail_3x': instance.thumbnail_3x,
    };
