import 'package:json_annotation/json_annotation.dart'; 
  
part 'result_body.g.dart';


@JsonSerializable()
  class Result_body extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'result')
  List<Result> result;

  Result_body(this.code,this.message,this.result,);

  factory Result_body.fromJson(Map<String, dynamic> srcJson) => _$Result_bodyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Result_bodyToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'lrc')
  String lrc;

  @JsonKey(name: 'songid')
  int songid;

  @JsonKey(name: 'url')
  String url;

  Result(this.author,this.link,this.pic,this.type,this.title,this.lrc,this.songid,this.url,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
