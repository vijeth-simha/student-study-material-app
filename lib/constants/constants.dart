import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiEndpoint = dotenv.env['API_ENDPOINT'];

final apiRoutes = {
  "login": "/api/v1/auth/register",
};
