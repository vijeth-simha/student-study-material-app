import 'package:flutter_dotenv/flutter_dotenv.dart';

final String? apiEndpoint = dotenv.env['API_ENDPOINT'];

final Map<dynamic, dynamic> apiRoutes = {
  "login": "/api/v1/auth/register",
};
