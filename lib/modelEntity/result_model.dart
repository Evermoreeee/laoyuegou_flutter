
class ResultData {
  ResultData({
    this.author,
    this.link,
    this.pic,
    this.type,
    this.title,
    this.lrc,
    this.songid,
    this.url
  });
  
  factory ResultData.fromJson(Map<String, dynamic> json) {
    return ResultData(
      author: json['author'] as String,
      link: json['link'] as String,
      pic: json['pic'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      lrc: json['lrc'] as String,
      songid: json['songid'] as int,
      url: json['url'] as String
    );
  }
  final String author;
  final String link;
  final String pic;
  final String type;
  final String title;
  final String lrc;
  final int songid;
  final String url;
}