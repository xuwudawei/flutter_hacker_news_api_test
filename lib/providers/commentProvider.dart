import 'package:flutter/material.dart';
import 'package:news_api_app/models/commentModel.dart';

class CommentProvider extends ChangeNotifier {
  List<CommentModel> comments = [];
  List<CommentModel> getAllComments() {
    return comments;
  }

  void addAllComments(List<CommentModel> l) {
    comments = l;
    notifyListeners();
  }
}
