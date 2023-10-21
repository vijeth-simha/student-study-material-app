class CategorySchema {
  int id;
  String title;
  String createdAt;
  String categoryPic;
  String shortDescription;

  CategorySchema(
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.categoryPic,
      required this.shortDescription});

  factory CategorySchema.fromJson(Map<dynamic, dynamic> json) {
    return CategorySchema(
        id: json["id"],
        title: json["title"],
        createdAt: json["createdAt"],
        categoryPic: json["categoryPic"],
        shortDescription: json["shortDescription"]);
  }
}
