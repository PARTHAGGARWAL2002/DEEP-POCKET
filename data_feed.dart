// ignore_for_file: constant_identifier_names

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

enum tag {
  all,
  Query,
  Games,
  Doubt,
  Selling,
  CabShare,
  Announcement,
  OpenDiscussion,
}

class dataFeed with ChangeNotifier {
  final String id = DateTime.now().toString();
  final String name;
  final String title;
  final String text;
  final String imgsrc;
  final DateTime date = DateTime.now();
  final tag Tag;

  dataFeed({
    required this.imgsrc,
    required this.name,
    required this.title,
    this.Tag = tag.all,
    required this.text,
  });
}
