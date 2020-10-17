import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:motiv_hackathon_app/data/api/real/handlers/auth.dart';
import 'package:motiv_hackathon_app/models/human_resource_user.dart';

import 'config.dart';

void main() {
  test('Invalid user login', () async {
    final regHandlers = AuthHandlers(apiPath: TestServerConfig.path);
    Response response = await regHandlers.login(null);
    expect(response, null);
  });

  test('Valid user login', () async {
    final regHandlers = AuthHandlers(apiPath: TestServerConfig.path);
    Response response = await regHandlers.login(
      HumanResourceUser(
        username: 'admin',
        password: 'admin',
      ),
    );
    expect(response.statusCode, 200);
  });
}
