import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/data/social_app/models/post_model.dart';
import 'package:flutter_application_new/data/social_app/repositories/dummy_data.dart';
import 'package:flutter_application_new/data/social_app/widgets/post_widget.dart';

class AllPosts extends StatelessWidget {
  Function function;
  AllPosts(this.function);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: ((context, index) {
        return PostWidget(posts[index], function);
      }),
    );
  }
}
