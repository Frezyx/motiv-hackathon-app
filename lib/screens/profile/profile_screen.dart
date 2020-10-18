import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motiv_hackathon_app/blocs/launch_navigator_bloc.dart';
import 'package:motiv_hackathon_app/blocs/user_repository_bloc.dart';
import 'package:motiv_hackathon_app/data/api/real/config.dart';
import 'package:motiv_hackathon_app/data/prepare/prepare.dart';
import 'package:motiv_hackathon_app/models/job_seeker_user.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';
import 'package:provider/provider.dart';

import '../../theme/design/design_theme.dart';
import '../../theme/design/design_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userRepositoryBloc = Provider.of<UserRepositoryBloc>(context);
    final launchNavigatorBloc = Provider.of<LaunchNavigatorBloc>(context);
    return Scaffold(
      body: FutureBuilder(
        future: RequestPrepare.getHistory(),
        builder: (BuildContext context,
            AsyncSnapshot<List<JobSeekerUser>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (!snapshot.hasError) {
                return ListView.separated(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final user = snapshot.data[index];
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              ServerConfig.serverPath + user.image,
                            ),
                          ),
                          trailing: !user.interesting
                              ? Icon(FontAwesomeIcons.solidThumbsDown)
                              : Icon(
                                  FontAwesomeIcons.solidThumbsUp,
                                  color: DesignTheme.mainColor,
                                ),
                          title: Text("${user.name}")),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 1,
                      color: DesignTheme.grey,
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pop(context);
          userRepositoryBloc.repository.clear();
          launchNavigatorBloc.selectedPage = LaunchPages.Auth;
        },
        child: Icon(Icons.exit_to_app, color: Colors.white),
      ),
    );
  }
}
