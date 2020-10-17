import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/blocs/launch_navigator_bloc.dart';
import 'package:motiv_hackathon_app/blocs/user_repository_bloc.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userRepositoryBloc = Provider.of<UserRepositoryBloc>(context);
    final launchNavigatorBloc = Provider.of<LaunchNavigatorBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pop(context);
          userRepositoryBloc.repository.clear();
          launchNavigatorBloc.selectedPage = LaunchPages.Auth;
        },
      ),
    );
  }
}
