import 'package:motiv_hackathon_app/models/interfaces/user_interface.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';

abstract class UserRepositoryInterface {
  Future<void> open() async {}

  Future<void> close() async {}

  checkIsSetUser() {}

  Future<bool> clear() async {}

  Future<bool> create(UserInterface user) async {}

  UserInterface getAuthorized() {}

  AuthStatus getAuthorizedStatus() {}
}
