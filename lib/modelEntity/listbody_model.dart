
class ListBody {
  final int code;
  final String message;
  final String pic;
  
  ListBody({
    this.code,
    this.message,
    this.pic,
    
  });
  factory ListBody.fromJson(Map<String, dynamic> json) {
    return ListBody(
      code: json['code'] as int,
      message: json['message'] as String,
      pic: json['pic'] as String,
    );
  }
}