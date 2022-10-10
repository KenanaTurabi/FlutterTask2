import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/task_management/main_task_screen.dart';

import 'data.dart';
import 'news.dart';

//wedget is the smallest unit in flatter
//const to increase the performance

void main(List<String> args) {
  runApp(MaterialApp(
    home: MainTaskScreen(),
  ));
}

/////////////////////pictures/////////////////////////

/*
class ui extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                //child: Image.asset('images/image4.jpg', fit: BoxFit.cover),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Image.asset(
                  'images/image1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/image1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Image.asset(
                  'images/image1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/image1.jpg')),
                ),
              ),
            ],
          ),
        ));
  }
}//CLASS
*/
class MyPostScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPostScreenState();
  }
}

class MyPostScreenState extends State<MyPostScreen> {
  List<String> comments = [' '];
  bool isLiked = false;
  bool isDark = false;
  String content = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDark = true;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(title: Text('My First Post')),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/img3.jpg'),
                      radius: 35,
                    ),
                    SizedBox(width: 10), //TO MAKE SPACE BETWEEN COMPONENTS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Kenana Turabi'), Text('since 22 min')],
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    CupertinoSwitch(
                      value: isDark,
                      onChanged: (k) {
                        //k = isDark! from flutter
                        isDark = k;
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(5),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/img3.jpg'),
                  ),
                ),
              ),
              _likeCondetion(),

              Text('Write A Comment'),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (v) {
                        content = v;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      comments.add(content);
                      setState(() {});
                    },
                    child: Container(
                      child: Icon(Icons.send),
                    ),
                  )
                ],
              ),
              ...comments.map((e) {
                return Text(e);
              }).toList(),

              /*
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      isLiked = !isLiked;
                      setState(() {});
                    },
                    child: Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            */
              // _AcceptCondetions()
            ],
          ),
        ),
      ),
    );
  } //build
} //class

/*
class _Mode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ModeState();
  }
}

class _ModeState extends State<_Mode> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/
class _likeCondetion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _likeState();
  }
}

class _likeState extends State<_likeCondetion> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              isLike = !isLike;
              setState(() {});
            },
            child: Icon(
              Icons.favorite,
              size: 30,
              color: isLike ? Colors.red : Colors.grey,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.share,
            size: 25,
          )
        ],
      ),
    );
  }
}

class _AcceptCondetions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AcceptConditionState();
  }
}

class _AcceptConditionState extends State<_AcceptCondetions> {
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Switch(
            value: isAccepted,
            onChanged: (v) {
              isAccepted = v!;
              setState(() {});
            },
          ),
          /*
          Checkbox(
              value: isAccepted,
              onChanged: (value) {
                isAccepted = value!;
                setState(() {});
              })
              */
        ],
      ),
    );
  }
}
/////////////////////news/////////////////////////

/*
class Ui extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Application'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: news.map((e) {
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(e['urlToImage'] ?? "",
                      errorBuilder: (x, y, z) {
                    return Center(
                      child: Icon(Icons.broken_image),
                    );

                    /*  return Image.asset(
                      'images/img3.jpg',
                      fit: BoxFit.cover,
                    ); */
                  }),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        e['author'] ?? "",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        e['publishedAt' ?? ""],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  width: double.infinity,
                  height: 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e['description'],
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(e['title'],
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500))
                      ]),
                ),
                Divider(
                  color: Colors.black,
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
*/
