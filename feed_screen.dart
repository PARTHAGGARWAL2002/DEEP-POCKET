import 'package:deep_pocket/models/data_feed.dart';
import 'package:deep_pocket/models/mock_data.dart';
import 'package:deep_pocket/widgets/menu_buttons.dart';
import 'package:deep_pocket/widgets/post_widget.dart';
import 'package:deep_pocket/widgets/user_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class feedScreen extends StatefulWidget {
  @override
  State<feedScreen> createState() => _feedScreenState();
}

class _feedScreenState extends State<feedScreen> {
  tag filter = tag.all;

  void updateFilter(tx, context) {
    setState(() {
      filter = tx;
    });

    Navigator.of(context).pop();
  }

  void filterSheet(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) => Container(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          return updateFilter(tag.all, ctx);
                        },
                        child: const Text('All')),
                    TextButton(
                        onPressed: () {
                          return updateFilter(tag.Query, ctx);
                        },
                        child: const Text('Query')),
                    TextButton(
                        onPressed: () {
                          return updateFilter(tag.Games, ctx);
                        },
                        child: const Text('Games')),
                    TextButton(
                        onPressed: () {
                          return updateFilter(tag.Doubt, ctx);
                        },
                        child: const Text('Doubt')),
                    TextButton(
                        onPressed: () {
                          return updateFilter(tag.Selling, ctx);
                        },
                        child: const Text('Selling')),
                    TextButton(
                        onPressed: () {
                          return updateFilter(tag.CabShare, ctx);
                        },
                        child: const Text('CabShare')),
                    TextButton(
                        onPressed: () {
                          return updateFilter(tag.Announcement, ctx);
                        },
                        child: const Text('Announcement')),
                    TextButton(
                        onPressed: () {
                          return updateFilter(tag.OpenDiscussion, ctx);
                        },
                        child: const Text('Open Discussion')),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    var posts = Provider.of<mockData>(context).items;
    if (filter != tag.all) {
      posts = posts.where((i) => i.Tag == filter).toList();
    }
    return Scaffold(
      // drawer: Drawer(
      //     // Populate the Drawer in the next step.
      //     ),
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          TextButton(
              onPressed: () => {filterSheet(context)},
              child: const Text(
                "Filters",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            menuButtons(),
            Container(
              height: 600,
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: posts.length,
                  itemBuilder: (ctx, i) => postWidget(post: posts[i])),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, userInput.route);
          },
          child: const Icon(Icons.add)),
    );
  }
}
