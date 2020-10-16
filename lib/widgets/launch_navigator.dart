import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/blocs/user_repository_bloc.dart';
import 'package:motiv_hackathon_app/screens/auth_screen/auth_screen.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';
import 'package:provider/provider.dart';

class LaunchNavigator extends StatelessWidget {
  const LaunchNavigator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userRepositoryBloc = Provider.of<UserRepositoryBloc>(context);
    final launchPage = _getPage(userRepositoryBloc);
    switch (launchPage) {
      case LaunchPages.Home:
        return AuthScreen();
        break;
      default:
        return Scaffold();
    }
  }

  LaunchPages _getPage(UserRepositoryBloc userRepositoryBloc) {
    final authStatus = userRepositoryBloc.repository.getAuthorizedStatus();
    final isAuthorized = authStatus == AuthStatus.Authorized;
    return isAuthorized ? LaunchPages.Home : LaunchPages.Auth;
  }
}
