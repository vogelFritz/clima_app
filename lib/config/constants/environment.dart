import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String openWeatherMapKey = dotenv.env['API_KEY'] ?? 'no-key';
}
