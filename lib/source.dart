class Source {
  late String name;
  late int id;
  Source.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    id = map['id'];
  }
}
