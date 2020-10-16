import 'package:motiv_hackathon_app/models/interfaces/user_interface.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';

import '../user_repository.dart';

class LocalUserRepository extends UserRepository {
  Future<void> open() async {
    //todo: implement
    throw UnimplementedError();
  }

  Future<void> close() async {
    //todo: implement
    throw UnimplementedError();
  }

  checkIsSetUser() {
    //todo: implement
    throw UnimplementedError();
  }

  Future<bool> clear() async {
    //todo: implement
    throw UnimplementedError();
  }

  Future<bool> create(UserInterface user) async {
    //todo: implement
    throw UnimplementedError();
  }

  UserInterface getAuthorized() {
    //todo: implement
    throw UnimplementedError();
  }

  AuthStatus getAuthorizedStatus() {
    //todo: implement
    throw UnimplementedError();
  }
}
