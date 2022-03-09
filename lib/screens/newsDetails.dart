import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_api_app/app.dart';
import 'package:news_api_app/models/commentModel.dart';
import 'package:news_api_app/providers/commentProvider.dart';
import 'package:news_api_app/screens/commentTile.dart';
import 'package:news_api_app/services/story.dart';
import 'package:provider/provider.dart';

class NewsDetails extends StatefulWidget {
  final String? title;
  final String? text;
  final List? commentsList;
  const NewsDetails({
    Key? key,
    @required this.title,
    @required this.text,
    @required this.commentsList,
  }) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    // getAllComments(context);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    List<CommentModel> comments = [];
    final commentProv = Provider.of<CommentProvider>(context);
    for (var i in widget.commentsList!) {
      var data = await StoryRequest.getOneItemById(id: i);
      if (!data["error"]) {
        CommentModel c = CommentModel.fromJson(data["data"]);
        comments.add(c);
      }
    }
    commentProv.addAllComments(comments);
  }

  @override
  Widget build(BuildContext context) {
    final commentProv = Provider.of<CommentProvider>(context);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Text(
              widget.title!,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.text!,
              style: TextStyle(
                fontSize: 21,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                "Comments",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Colors.red,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: commentProv.getAllComments().length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return CommentTile(
                    text: commentProv.getAllComments()[index].text,
                    by: commentProv.getAllComments()[index].by,
                  );
                }),
          )
        ],
      ),
    );
  }
}
