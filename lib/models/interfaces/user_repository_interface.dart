import 'package:motiv_hackathon_app/utils/enums.dart';
import '../user.dart';

abstract class UserRepositoryInterface {
  Future<void> open() async {}

  Future<void> close() async {}

  checkIsSetUser() {}

  Future<bool> clear() async {}

  Future<bool> create(User user) async {}

  User getAuthorized() {}

  AuthStatus getAuthorizedStatus() {}
}
