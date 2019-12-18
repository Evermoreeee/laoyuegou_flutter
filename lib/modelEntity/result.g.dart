// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['author'] as String,
      json['link'] as String,
      json['pic'] as String,
      json['type'] as String,
      json['title'] as String,
      json['lrc'] as String,
      json['songid'] as int,
      json['url'] as String);
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'author': instance.author,
      'link': instance.link,
      'pic': instance.pic,
      'type': instance.type,
      'title': instance.title,
      'lrc': instance.lrc,
      'songid': instance.songid,
      'url': instance.url
    };
