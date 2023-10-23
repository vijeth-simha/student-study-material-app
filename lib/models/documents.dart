class DocumentSchema {
  int id;
  String title;
  String createdAt;
  String? updatedAt;
  String subjectPic;
  String shortDescription;

  DocumentSchema(
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.shortDescription,
      required this.subjectPic,
      required this.updatedAt});

  factory DocumentSchema.fromJson(Map<dynamic, dynamic> json) {
    return DocumentSchema(
        id: json["id"],
        title: json["title"],
        createdAt: json["createdAt"],
        shortDescription: json["shortDescription"],
        subjectPic: json["subjectPic"],
        updatedAt: json["updatedAt"]);
  }
}
