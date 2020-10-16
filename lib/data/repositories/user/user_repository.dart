import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/models/interfaces/user_repository_interface.dart';
import 'package:motiv_hackathon_app/models/user.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';

class UserRepository implements UserRepositoryInterface {
  final UserRepositoryInterface _repository;
  UserRepository({
    @required UserRepositoryInterface repository,
  }) : _repository = repository;

  @override
  checkIsSetUser() => _repository.checkIsSetUser();

  @override
  Future<bool> clear() => _repository.clear();

  @override
  Future<void> close() => _repository.close();

  @override
  Future<bool> create(User user) => _repository.create(user);

  @override
  User getAuthorized() => _repository.getAuthorized();

  @override
  AuthStatus getAuthorizedStatus() => _repository.getAuthorizedStatus();

  @override
  Future<void> open() => _repository.open();
}
