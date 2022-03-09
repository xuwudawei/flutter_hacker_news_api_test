import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CommentTile extends StatelessWidget {
  final String? text;
  final String? by;

  const CommentTile({Key? key, @required this.text, @required this.by})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Html(data: text!),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              by!,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
