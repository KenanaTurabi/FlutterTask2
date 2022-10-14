// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  String? content;
  String? image;
  bool isFavourite;
  PostUserModel? postUserModel;
  PostModel({
    this.content,
    this.image,
    this.isFavourite = false,
    this.postUserModel,
  });
}

class PostUserModel {
  String? name;
  String? image;
  PostUserModel({
    this.name,
    this.image,
  });
}
