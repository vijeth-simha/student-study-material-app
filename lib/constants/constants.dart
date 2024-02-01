import 'package:flutter_dotenv/flutter_dotenv.dart';

final String? apiEndpoint = dotenv.env['API_ENDPOINT'];
final String? apiImageURLEndpoint = dotenv.env['API_IMAGE_URL_ENDPOINT'];

final Map<dynamic, dynamic> apiRoutes = {
  "login": "api/v1/auth/login",
  "category": "api/v1/category/get-all-categories",
  "semester": "api/v1/semester/get-all-semesters",
  "subject": "api/v1/subject/get-all-subjects",
  "lesson": "api/v1/lesson/get-all-lessons",
  "document": "api/v1/document/get-all-documents",
};

final Map<dynamic, dynamic> imageURL = {
  "category": '$apiImageURLEndpoint/dynamic/category-images',
  "semester": '$apiImageURLEndpoint/dynamic/semester-images',
  "subject": '$apiImageURLEndpoint/dynamic/subject-images',
  "lesson": '$apiImageURLEndpoint/dynamic/lesson-images',
};
