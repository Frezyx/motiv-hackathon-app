import 'package:motiv_hackathon_app/data/api/real/server.dart';
import 'package:motiv_hackathon_app/models/human_resource_user.dart';

class RequestPrepare {
  static Future<bool> loginUser(HumanResourceUser user) async {
    final response = await Server.regHandlers.login(user);
    return response.statusCode == 200;
  }
}
