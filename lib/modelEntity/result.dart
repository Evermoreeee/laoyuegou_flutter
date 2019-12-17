
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  final String author;
  final String link;
  final String pic;
  final String type;
  final String title;
  final String lrc;
  final int songid;
  final String url;
  Result({
    this.author,
    this.link,
    this.pic,
    this.type,
    this.title,
    this.lrc,
    this.songid,
    this.url
  });
  //反序列化
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

