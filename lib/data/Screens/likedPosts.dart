import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/data/social_app/models/post_model.dart';
import 'package:flutter_application_new/data/social_app/repositories/dummy_data.dart';
import 'package:flutter_application_new/data/social_app/widgets/post_widget.dart';

class LikedPostsScreen extends StatelessWidget {
  Function function;
  LikedPostsScreen(this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: posts.where((element) => element.isFavourite).length,
      itemBuilder: ((context, index) {
        return PostWidget(
            posts.where((element) => element.isFavourite).toList()[index],
            function);
      }),
    );
  }
}
