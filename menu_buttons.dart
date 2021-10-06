import 'package:flutter/material.dart';

class menuButtons extends StatelessWidget {
  const menuButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.lightBlue,
            padding: EdgeInsets.all(10),
            width: double.maxFinite,
            child: const Text(
              "MENU",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 200,
            child: GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 1.0),
              children: const [
                IconButton(loc: 'assets/employee.png', title: 'INTERNSHIPS'),
                IconButton(loc: 'assets/club.png', title: 'CLUBS'),
                IconButton(loc: 'assets/event.png', title: 'EVENTS'),
                IconButton(loc: 'assets/map.png', title: 'NEAR BY'),
                IconButton(loc: 'assets/noticeboard.png', title: 'NOTICE'),
                IconButton(loc: 'assets/school.png', title: 'FACULTY'),
                IconButton(loc: 'assets/open-book.png', title: 'RESOURCES'),
                IconButton(
                    loc: 'assets/online-course.png', title: 'FREE COURSE')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  const IconButton({
    Key? key,
    required this.loc,
    required this.title,
  }) : super(key: key);

  final String loc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(0.8),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.blue,
            width: 1,
          )),
          child: Container(
            margin: const EdgeInsets.all(0.2),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue, width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  loc,
                  width: 40,
                  height: 40,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
