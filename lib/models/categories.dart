class CategorySchema {
  int id;
  String title;
  String createdAt;
  String? updatedAt;
  String categoryPic;
  String shortDescription;

  CategorySchema(
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.updatedAt,
      required this.categoryPic,
      required this.shortDescription});

  factory CategorySchema.fromJson(Map<dynamic, dynamic> json) {
    return CategorySchema(
        id: json["id"],
        title: json["title"] ?? " ",
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"] ?? "2023-08-08T04:16:16.392Z",
        categoryPic: json["categoryPic"],
        shortDescription: json["shortDescription"]);
  }
}
