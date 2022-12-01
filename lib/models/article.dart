class Article {
  late String sId;
  late String title;
  late String body;
  late String image;
  late String category;
  late String description;
  late DateTime date;

  Article({
    required this.sId,
    required this.title,
    required this.body,
    required this.image,
    required this.category,
    required this.description,
  //  required this.date

  });

  Article.fromJson(Map<String, dynamic> json) {

    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    body = json['body'];
    category = json['category'];
    image = json['image'];
    //date = json['date'];
  }

}

