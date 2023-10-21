import 'dart:convert';
import 'package:http/http.dart';
import 'package:student_study_material/models/categories.dart';

class Category {
  List<CategorySchema> categoriesList = [];

  Future<void> getAllCategories() async {
    try {
      Response response = await get(Uri.https(
          '658c4bf7-8882-45f0-bae2-9d3f36443e22.mock.pstmn.io',
          'api/v1/category/get-all-categories'));
      if (response.statusCode == 200) {
        print(response.body);
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
