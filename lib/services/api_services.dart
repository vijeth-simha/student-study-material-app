import 'dart:convert';
import 'package:http/http.dart';
import 'package:student_study_material/models/categories.dart';
import 'package:student_study_material/models/semester.dart';

class Category {
  List<CategorySchema> categoriesList = [];

  Future<void> getAllCategories() async {
    try {
      Response response = await get(Uri.https(
          '62c70fdf-ba4a-4fc0-9e5c-c8e6a8482754.mock.pstmn.io',
          'api/v1/category/get-all-categories'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        categoriesList = responseData
            .map((category) => CategorySchema.fromJson(category))
            .toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Failed to load posts $e');
    }
  }
}

class Semester {
  List<SemesterSchema> semesterList = [];

  Future<void> getAllSemesters() async {
    try {
      Response response = await get(Uri.https(
          '62c70fdf-ba4a-4fc0-9e5c-c8e6a8482754.mock.pstmn.io',
          'api/v1/category/get-all-categories'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        semesterList = responseData
            .map((category) => SemesterSchema.fromJson(category))
            .toList();
      } else {
        throw Exception('Failed to load semesters');
      }
    } catch (e) {
      throw Exception('Failed to load semesters $e');
    }
  }
}
