import 'dart:convert';
import 'package:http/http.dart';
import 'package:student_study_material/models/categories.dart';
import 'package:student_study_material/models/semester.dart';
import 'package:student_study_material/models/subject.dart';
import 'package:student_study_material/models/documents.dart';

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
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Failed to load categories $e');
    }
  }
}

class Semester {
  List<SemesterSchema> semesterList = [];

  Future<void> getAllSemesters(String categoryId) async {
    try {
      Response response = await get(Uri.https(
          '62c70fdf-ba4a-4fc0-9e5c-c8e6a8482754.mock.pstmn.io',
          'api/v1/semester/get-all-semesters',
          {'categoryId': categoryId}));
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
      Response response = await get(Uri.https(
          '62c70fdf-ba4a-4fc0-9e5c-c8e6a8482754.mock.pstmn.io',
          'api/v1/subject/get-all-subjects'));
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
      Response response = await get(Uri.https(
          '62c70fdf-ba4a-4fc0-9e5c-c8e6a8482754.mock.pstmn.io',
          'api/v1/semester/get-all-documents',
          {'subjectId': subjectId}));
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
