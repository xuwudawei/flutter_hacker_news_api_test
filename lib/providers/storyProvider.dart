import 'package:flutter/material.dart';
import 'package:news_api_app/models/storyModel.dart';

class StoryProvider extends ChangeNotifier {
  List<StoryModel> stories = [];
  List<StoryModel> getAllStories() {
    return stories;
  }

  void addOneNewStory(StoryModel story) {
    stories.add(story);
    notifyListeners();
  }

  void addAllTopStories(List<StoryModel> s) {
    stories = s;
    notifyListeners();
  }
}
