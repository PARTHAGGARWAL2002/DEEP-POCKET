import 'package:deep_pocket/models/data_feed.dart';
import 'package:flutter/material.dart';

class mockData with ChangeNotifier {
  final List<dataFeed> _data = [
    dataFeed(
      imgsrc: "https://i.pravatar.cc/150?u=a042581f4e29026704d",
      name: "Priyam Srivastava",
      title: "How to change room ?",
      Tag: tag.Query,
      text:
          "I would like to know the process of changing my room cause I have not been able to study, and my roomate always plays music and drinks too much then shouts all night, please tell me how",
    ),
    dataFeed(
      imgsrc: "https://i.pravatar.cc/150?u=a042581f4e29026704d",
      title: "Anyone intresed in playing BGMI?",
      name: "Part Agarwal",
      Tag: tag.Games,
      text:
          "So I have been looing for a squad for a long time and now i have finally decided that I am gonna buckle up and ask you all to join me",
    ),
  ];
  List<dataFeed> get items {
    return [..._data];
  }

  void addPost(dataFeed newpost) {
    final Post = dataFeed(
      imgsrc: "https://i.pravatar.cc/150?u=a042581f4e29026704d",
      name: "Priyam ",
      title: newpost.title,
      text: newpost.text,
      Tag: newpost.Tag,
    );
    _data.add(Post);
    notifyListeners();
  }
}
