import 'package:flutter/material.dart';
import 'package:news_api_app/screens/newsDetails.dart';

class NewsTile extends StatelessWidget {
  final String? title;
  final String? totalComments;

  final String? totalVotes;
  final List? commentsList;
  const NewsTile({
    Key? key,
    @required this.totalComments,
    @required this.title,
    @required this.totalVotes,
    @required this.commentsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsDetails(
            title: title,
            text:
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?",
            commentsList: commentsList,
          ),
        ),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Text(
                            totalVotes! + " votes",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 5,
                        ),
                        child: Icon(
                          Icons.chat_bubble_outline_outlined,
                          size: 25,
                        ),
                      ),
                      Text(
                        totalComments!,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
