import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // static String get fileName =>
  // kProfileMode ? ".env.production" : ".env.development";

  static String get fileName {
    if (kReleaseMode) {
      return "lib/core/utils/config/env/.env.production";
    } else if (kProfileMode) {
      return "lib/core/utils/config/env/.env.profile";
    }
    return "lib/core/utils/config/env/.env.development";
  }

  static String get apiUrl => dotenv.env['API_URL'] ?? 'MY_FALLBACK';
}
