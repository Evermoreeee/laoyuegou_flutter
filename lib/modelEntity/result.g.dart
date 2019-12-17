// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      author: json['author'] as String,
      link: json['link'] as String,
      pic: json['pic'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      lrc: json['lrc'] as String,
      songid: json['songid'] as int,
      url: json['url'] as String);
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
