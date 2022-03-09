import 'dart:convert';
import 'package:news_api_app/constants/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:news_api_app/constants/constants.dart';

class StoryRequest {
  static Future getIdsOfAllTopStories() async {
    var url = Uri.parse(serverAddress +
        HackerNewsServicePaths.version +
        HackerNewsServicePaths.getIDsofAllTopStories +
        ".json");
    try {
      var data = await http.get(url);
      var info = json.decode(data.body);
      return {"error": false, "data": info};
    } catch (e) {
      return {"error": true, "data": e};
    }
  }

  static Future getOneItemById({required int id}) async {
    var url = Uri.parse(serverAddress +
        HackerNewsServicePaths.version +
        HackerNewsServicePaths.getOneItemById +
        id.toString() +
        ".json");
    try {
      var data = await http.get(url);
      var info = json.decode(data.body);
      return {"error": false, "data": info};
    } catch (e) {
      return {"error": true, "data": e};
    }
  }
}
