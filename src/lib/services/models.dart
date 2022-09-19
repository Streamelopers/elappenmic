import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

abstract class BaseModel {
  Map<String, dynamic> toJson();
}

@JsonSerializable()
class YoutubeVideo implements BaseModel {
  String title;
  String description;
  String key;
  String published_at;
  String thumbnail;
  String thumbnail_2x;
  String thumbnail_3x;

  YoutubeVideo(
      {this.title = '',
      this.description = '',
      this.key = '',
      this.published_at = '',
      this.thumbnail = '',
      this.thumbnail_2x = '',
      this.thumbnail_3x = ''});

  factory YoutubeVideo.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$YoutubeVideoToJson(this);
}
