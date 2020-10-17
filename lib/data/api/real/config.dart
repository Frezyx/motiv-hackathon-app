import 'package:flutter_dotenv/flutter_dotenv.dart';

class ServerConfig {
  static String _getServerAddress() {
    return DotEnv().env['SERVER_ADDRESS'];
  }

  static String _getApiPath() {
    return DotEnv().env['API_PATH'];
  }

  static String _getProtocol() {
    return DotEnv().env['PROTOCOL'];
  }

  static String path = _getProtocol() + _getServerAddress() + _getApiPath();
  static String serverPath = _getProtocol() + _getServerAddress();
}
