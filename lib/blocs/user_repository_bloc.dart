import 'package:flutter/widgets.dart';
import 'package:motiv_hackathon_app/models/interfaces/user_repository_interface.dart';

class UserRepositoryBloc extends ChangeNotifier {
  final UserRepositoryInterface _repository;
  UserRepositoryBloc({
    @required UserRepositoryInterface repository,
  }) : _repository = repository;

  UserRepositoryInterface get repository => _repository;
}
