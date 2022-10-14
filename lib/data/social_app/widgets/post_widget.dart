import 'package:flutter/material.dart';
import 'package:flutter_application_new/data/social_app/models/post_model.dart';

class PostWidget extends StatelessWidget {
  Function function;
  PostModel postModel;
  PostWidget(this.postModel, this.function);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(postModel.postUserModel!.image!),
                radius: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postModel.postUserModel!.name!,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Text(
                    'Since 23 minuites',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(postModel.image!))),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  function(postModel);
                },
                child: Icon(
                  Icons.favorite,
                  color: postModel.isFavourite ? Colors.red : Colors.grey,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.share,
                size: 25,
              )
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Text(
              postModel.content!,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
