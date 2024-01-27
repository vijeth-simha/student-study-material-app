import 'dart:convert';
import 'package:http/http.dart';
import 'package:student_study_material/helpers/helperUtils.dart';
import 'package:student_study_material/models/categories.dart';
import 'package:student_study_material/models/semester.dart';
import 'package:student_study_material/models/subject.dart';
import 'package:student_study_material/models/documents.dart';
import 'package:student_study_material/constants/constants.dart';

class Category {
  List<CategorySchema> categoriesList = [];

  Future<void> getAllCategories() async {
    try {
      var url = Uri.https('$apiEndpoint', apiRoutes["category"]);
      final accessToken = await getAccessToken();
      Response response =
          await get(url, headers: {'Authorization': 'Bearer $accessToken'});
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        print(responseData);
        categoriesList = responseData
            .map((category) => CategorySchema.fromJson(category))
            .toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load categories $e');
    }
  }
}

class Semester {
  List<SemesterSchema> semesterList = [];

  Future<void> getAllSemesters(String categoryId) async {
    try {
      var url = Uri.https(
          '$apiEndpoint', apiRoutes["category"], {'categoryId': categoryId});
      final String? accessToken = await getAccessToken();
      Response response =
          await get(url, headers: {'Authorization': 'Bearer $accessToken'});

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        semesterList = responseData
            .map((semester) => SemesterSchema.fromJson(semester))
            .toList();
      } else {
        throw Exception('Failed to load semesters');
      }
    } catch (e) {
      throw Exception('Failed to load semesters $e');
    }
  }
}

class Subject {
  List<SubjectSchema> subjectsList = [];

  Future<void> getAllSubjects(String semesterId) async {
    try {
      var url = Uri.https(
          '$apiEndpoint', apiRoutes["category"], {'semesterId': semesterId});
      final String? accessToken = await getAccessToken();
      Response response =
          await get(url, headers: {'Authorization': 'Bearer $accessToken'});
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        subjectsList = responseData
            .map((subject) => SubjectSchema.fromJson(subject))
            .toList();
      } else {
        throw Exception('Failed to load subjects');
      }
    } catch (e) {
      throw Exception('Failed to load subjects $e');
    }
  }
}

class Document {
  List<DocumentSchema> documentsList = [];

  Future<void> getAllDocuments(String subjectId) async {
    try {
      var url = Uri.https(
          '$apiEndpoint', apiRoutes["category"], {'subjectId': subjectId});
      final String? accessToken = await getAccessToken();
      Response response =
          await get(url, headers: {'Authorization': 'Bearer $accessToken'});
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        documentsList = responseData
            .map((document) => DocumentSchema.fromJson(document))
            .toList();
      } else {
        throw Exception('Failed to load documents');
      }
    } catch (e) {
      throw Exception('Failed to load documents $e');
    }
  }
}
