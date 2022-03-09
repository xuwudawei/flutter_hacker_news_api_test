class CommentModel {
  String? by;
  int? id;
  int? parent;
  String? text;
  int? time;
  String? type;
  CommentModel({
    this.by,
    this.id,
    this.parent,
    this.text,
    this.time,
    this.type,
  });
  CommentModel.fromJson(Map<String, dynamic> parsedJson) {
    by = parsedJson['by'];
    id = parsedJson['id'];
    parent = parsedJson['parent'];
    text = parsedJson['text'];
    time = parsedJson['time'];
    type = parsedJson['type'];
  }
}
