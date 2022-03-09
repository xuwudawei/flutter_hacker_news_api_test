import 'package:news_api_app/models/commentModel.dart';

class StoryModel {
  String? by;
  int? descendants;
  int? id;
  List? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;
  String? text;
  StoryModel({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
  });
  StoryModel.fromJson(Map<String, dynamic> parsedJson) {
    by = parsedJson['by'];
    descendants = parsedJson['descendants'];
    id = parsedJson['id'];
    kids = parsedJson['kids'];
    score = parsedJson['score'];
    time = parsedJson['time'];

    title = parsedJson['title'];
    type = parsedJson['type'];
    url = parsedJson['url'];
  }
}
