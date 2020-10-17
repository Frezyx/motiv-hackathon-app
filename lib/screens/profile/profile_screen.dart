import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motiv_hackathon_app/blocs/launch_navigator_bloc.dart';
import 'package:motiv_hackathon_app/blocs/user_repository_bloc.dart';
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
            body: ListView.separated(
        itemCount: 5,
        itemBuilder: (BuildContext context,int index){
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListTile(
              
              leading:    ClipRRect(
          borderRadius: BorderRadius.circular(8), child: Image.network('https://v.img.com.ua/b/1100x999999/0/a0/62dac88c6e9068b8b8b4eb360d9a6a00.jpg'),),
              trailing: index % 2 == 0 ? Icon(FontAwesomeIcons.solidThumbsDown) : Icon(FontAwesomeIcons.solidThumbsUp,color: DesignTheme.mainColor,),
              title:Text("List item $index")
              ),
          );
        }, separatorBuilder: (BuildContext context, int index) {  
          return Container(
            height: 1,
            color: DesignTheme.grey,
          );
        },
        ),
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
