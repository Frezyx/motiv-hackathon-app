import 'package:hive/hive.dart';
import 'package:motiv_hackathon_app/models/user.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';

import '../user_repository.dart';

class MockUserRepository extends UserRepository {
  final _repoKey = 'moauth';
  final _fakeEmail = 'test@gmail.com';

  Future<void> open() async {
    await Hive.openBox<bool>(_repoKey);
  }

  Future<void> close() async {
    await Hive.box<bool>(_repoKey).compact();
  }

  checkIsSetUser() {
    //todo: implement
    throw UnimplementedError();
  }

  Future<bool> clear() async {
    await Hive.box<bool>(_repoKey).clear();
    return true;
  }

  Future<bool> create(User user) async {
    await Hive.box<bool>(_repoKey).put(_fakeEmail, true);
    return true;
  }

  User getAuthorized() {
    //todo: implement
    throw UnimplementedError();
  }

  AuthStatus getAuthorizedStatus() {
    return AuthStatus.Authorized;
    // final box = Hive.box<bool>(_repoKey);
    // final isEmailSet = box.get(_fakeEmail);
    // return isEmailSet ?? false
    //     ? AuthStatus.Authorized
    //     : AuthStatus.Unauthorized;
  }
}
