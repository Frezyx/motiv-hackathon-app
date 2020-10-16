import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:motiv_hackathon_app/models/user.dart';
import 'package:motiv_hackathon_app/widgets/launch_navigator.dart';
import 'package:provider/provider.dart';

import 'blocs/user_repository_bloc.dart';
import 'data/repositories/user/mock/repository.dart';
import 'data/repositories/user/user_repository.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureHive();
  final userRepository = await _configureUserRepository();
  runApp(MyApp(userRepository : userRepository));
}

Future _configureHive() async {
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
}

Future<UserRepository> _configureUserRepository() async {
  final userRepository = UserRepository(repository: MockUserRepository());
  await userRepository.open();
  return userRepository;
}

class MyApp extends StatelessWidget {
  const MyApp({UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (ctx) => UserRepositoryBloc(repository: _userRepository)),
        Provider<User>(create: (ctx) => null)
      ],
      builder: (ctx, w) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LaunchNavigator();
  }
}
