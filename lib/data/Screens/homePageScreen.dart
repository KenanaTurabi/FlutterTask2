import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_new/data/Screens/allPosts.dart';
import 'package:flutter_application_new/data/Screens/likedPosts.dart';
import 'package:flutter_application_new/data/social_app/models/post_model.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 0;

  void checkpost(PostModel postModel) {
    postModel.isFavourite = !postModel.isFavourite;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Social App'),
      ),
      body: PageView(
          controller: pageController,
          children: [AllPosts(checkpost), LikedPostsScreen(checkpost)]),
      //the differnce between page view and list view that page viwe each element is page while list view each element is a widget
      //when we use lpage view so we dont have to use statefull and single ticker provider
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: ((index) {
            currentIndex =
                index; //current index means which item to change its color into blue
            setState(() {});
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 100), curve: Curves.linear);
          }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourite")
          ]),
    );
  }
}
/*class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}*/


/*
class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  initialize() {
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void initState() {
    // TODO: implement initState
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social App'),
      ),
      body: TabBarView(
          controller: tabController,
          children: [AllPosts(), LikedPostsScreen()]),
      bottomNavigationBar: BottomNavigationBar(
          onTap: ((index) {
            index == 0
                ? tabController.animateTo(0)
                : tabController.animateTo(1);
          }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourite")
          ]),
    );
  }
}
*/