class SemesterSchema {
  int id;
  String title;
  String createdAt;
  String? updatedAt;
  String semesterPic;
  String shortDescription;

  SemesterSchema(
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.shortDescription,
      required this.semesterPic,
      required this.updatedAt});

  factory SemesterSchema.fromJson(Map<dynamic, dynamic> json) {
    return SemesterSchema(
        id: json["id"],
        title: json["title"],
        createdAt: json["createdAt"],
        shortDescription: json["shortDescription"],
        semesterPic: json["semesterPic"],
        updatedAt: json["updatedAt"]);
  }
}
