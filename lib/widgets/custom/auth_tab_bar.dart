import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/blocs/auth_screen_bloc.dart';
import 'package:motiv_hackathon_app/theme/design/design_theme.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';
import 'package:provider/provider.dart';

class AuthTabBar extends StatelessWidget {
  const AuthTabBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authScreenBloc = Provider.of<AuthScreenBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          onPressed: () => authScreenBloc.selectedPage = AuthPages.Login,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            "Вход",
            style: TextStyle().copyWith(
              fontSize: 14,
              color: authScreenBloc.selectedPage == AuthPages.Login
                  ? DesignTheme.mainColor
                  : Colors.grey,
            ),
          ),
        ),
        FlatButton(
          onPressed: () => authScreenBloc.selectedPage = AuthPages.Reg,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            "Регистрация",
            style: TextStyle().copyWith(
              fontSize: 14,
              color: authScreenBloc.selectedPage == AuthPages.Reg
                  ? DesignTheme.mainColor
                  : Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
