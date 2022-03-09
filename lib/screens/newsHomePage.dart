import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_api_app/models/storyModel.dart';
import 'package:news_api_app/providers/storyProvider.dart';
import 'package:news_api_app/screens/newsDetails.dart';
import 'package:news_api_app/screens/newsTile.dart';
import 'package:news_api_app/services/story.dart';
import 'package:provider/provider.dart';

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({Key? key}) : super(key: key);

  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getAllStories(context);
  }

  Future<void> getAllStories(context) async {
    setState(() {
      isLoading = true;
    });
    final storyProv = Provider.of<StoryProvider>(context, listen: false);
    List<StoryModel> allStories = [];
    var data = await StoryRequest.getIdsOfAllTopStories();
    if (!data["error"]) {
      List l = data["data"];
      for (int i = 1; i < 11; i++) {
        var storyData = await StoryRequest.getOneItemById(id: l[i]);
        if (!storyData["error"]) {
          var storyModel = StoryModel.fromJson(storyData["data"]);
          allStories.add(storyModel);
        } else {
          print(storyData["info"]);
        }
      }
    }
    storyProv.addAllTopStories(allStories);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final storyProv = Provider.of<StoryProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Hacker News API!'),
      ),
      body: isLoading
          ? Center(
              child: SpinKitChasingDots(
                color: Colors.redAccent,
                size: 50.0,
              ),
            )
          : Column(
              children: [
                Container(
                  height: 720,
                  child: ListView.builder(
                      itemCount: storyProv.getAllStories().length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return NewsTile(
                          title: storyProv.getAllStories()[index].title,
                          totalVotes:
                              storyProv.getAllStories()[index].score.toString(),
                          totalComments: storyProv
                              .getAllStories()[index]
                              .descendants
                              .toString(),
                          commentsList: storyProv.getAllStories()[index].kids,
                        );
                      }),
                )
              ],
            ),
    );
  }
}
