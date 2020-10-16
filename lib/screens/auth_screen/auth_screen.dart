import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/blocs/launch_navigator_bloc.dart';
import 'package:motiv_hackathon_app/theme/design/design_theme.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final launchNavigatorBloc = Provider.of<LaunchNavigatorBloc>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Лого"),
              Container(
                height: 45,
                width: 150,
                child: RaisedButton(
                  onPressed: () {},
                  color: DesignTheme.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    "Войти",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
