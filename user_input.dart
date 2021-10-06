import 'package:deep_pocket/models/data_feed.dart';
import 'package:deep_pocket/models/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selection_menu/selection_menu.dart';

class userInput extends StatefulWidget {
  static const route = '/user-input';

  @override
  State<userInput> createState() => _userInputState();
}

class _userInputState extends State<userInput> {
  late int _choiceindex;
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final _detailFocusNode = FocusNode();

  late dataFeed _editedPost;

  @override
  void dispose() {
    _detailFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _editedPost = dataFeed(
        imgsrc: "https://i.pravatar.cc/150?u=a042581f4e29026704d",
        name: "Priyam Srivastava",
        title: "",
        Tag: tag.all,
        text: '');
    _choiceindex = 0;
    super.initState();
  }

  final List<Map<String, dynamic>> chipdata = [
    {
      'name': 'Query',
      'Tag': tag.Query,
    },
    {
      'name': 'Games',
      'Tag': tag.Games,
    },
    {
      'name': 'Doubt',
      'Tag': tag.Doubt,
    },
    {
      'name': 'Selling',
      'Tag': tag.Selling,
    },
    {
      'name': 'CabShare',
      'Tag': tag.CabShare,
    },
    {
      'name': 'Announcement',
      'Tag': tag.Announcement,
    },
    {
      'name': 'Discussion',
      'Tag': tag.OpenDiscussion,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var maxLines = 8;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.all(5),
                width: double.maxFinite,
                child: const Text(
                  "TITLE",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )),
            TextField(
              textInputAction: TextInputAction.next,
             
              
              decoration: InputDecoration(
                // labelText: 'TITLE',

                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.0))),
                // hintText: "TITLE",
                filled: true,
                fillColor: Colors.grey[100],
              ),
       
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.all(5),
                width: double.maxFinite,
                child: const Text(
                  "DESCRIPTION",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )),
            Container(
              height: maxLines * 24.0,
              child: TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
                maxLines: maxLines,
                controller: ,
                focusNode: _detailFocusNode,
                decoration: InputDecoration(
                  // labelText: 'TITLE',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  // hintText: "TITLE",
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.all(5),
                width: double.maxFinite,
                child: const Text(
                  "TAG",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )),
            Container(
              alignment: AlignmentDirectional.topStart,
              // decoration: BoxDecoration(border: Border.all()),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      mainAxisExtent: 50,
                      crossAxisCount: 3),
                  itemCount: chipdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (ChoiceChip(
                      padding: const EdgeInsets.all(5),
                      label: FittedBox(
                          child: Text(chipdata[index]['name'] as String)),
                      selected: _choiceindex == index,
                      selectedColor: Colors.blue,
                      onSelected: (bool selected) {
                        setState(() {
                          _choiceindex = selected ? index : 0;

                          _editedPost = dataFeed(
                            imgsrc: _editedPost.imgsrc,
                            name: _editedPost.name,
                            title: _editedPost.title,
                            text: _editedPost.text,
                            Tag: chipdata[index]['Tag'] as tag,
                          );
                        });
                      },
                      backgroundColor: Colors.grey[300],
                      labelStyle: const TextStyle(color: Colors.black),
                    ));
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  print(_editedPost.title.toString());
                  Provider.of<mockData>(context, listen: false)
                      .addPost(_editedPost);

                  Navigator.of(context).pop();
                },
                child: const Text("SUBMIT"))
          ],
        ),
      ),
    );
  }
}
