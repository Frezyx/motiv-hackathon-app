import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/blocs/auth_screen_bloc.dart';
import 'package:motiv_hackathon_app/blocs/launch_navigator_bloc.dart';
import 'package:motiv_hackathon_app/blocs/user_repository_bloc.dart';
import 'package:motiv_hackathon_app/data/api/real/server.dart';
import 'package:motiv_hackathon_app/data/prepare/prepare.dart';
import 'package:motiv_hackathon_app/models/human_resource_user.dart';
import 'package:motiv_hackathon_app/theme/design/design_theme.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';
import 'package:motiv_hackathon_app/widgets/custom/auth_tab_bar.dart';
import 'package:motiv_hackathon_app/widgets/custom/custom_form_field.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({
    Key key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final launchNavigatorBloc = Provider.of<LaunchNavigatorBloc>(context);
    final authScreenBloc = Provider.of<AuthScreenBloc>(context);
    final userRepositoryBloc = Provider.of<UserRepositoryBloc>(context);
    final isLogin = authScreenBloc.selectedPage == AuthPages.Login;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Лого"),
                _buildForm(authScreenBloc),
                Container(
                  height: 45,
                  width: isLogin ? 150 : 190,
                  child: RaisedButton(
                    onPressed: () async {
                      await _login(userRepositoryBloc, launchNavigatorBloc);
                    },
                    color: DesignTheme.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Text(
                      isLogin ? "Войти" : "Зарегистрироваться",
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
      ),
    );
  }

  Future _login(
    UserRepositoryBloc userRepositoryBloc,
    LaunchNavigatorBloc launchNavigatorBloc,
  ) async {
    if (_formKey.currentState.validate()) {
      final user = HumanResourceUser(
        username: _loginController.text,
        password: _passwordController.text,
      );
      final status = await RequestPrepare.loginUser(user);
      if (status) {
        userRepositoryBloc.repository.create(user);
        launchNavigatorBloc.selectedPage = LaunchPages.Home;
      }
    }
  }

  Widget _buildForm(AuthScreenBloc authScreenBloc) {
    switch (authScreenBloc.selectedPage) {
      case AuthPages.Login:
        return _LoginForm(
          passwordController: _passwordController,
          loginController: _loginController,
        );
        break;
      default:
        return _RegForm();
        break;
    }
  }
}

class _RegForm extends StatelessWidget {
  const _RegForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTabBar(),
        CustomTextFormField(
          hintText: "Логин",
          controller: null,
        ),
        SizedBox(height: 10),
        CustomTextFormField(
          hintText: "Имя",
          controller: null,
        ),
        SizedBox(height: 10),
        CustomTextFormField(
          hintText: "Пароль",
          controller: null,
        ),
      ],
    );
  }
}

class _LoginForm extends StatelessWidget {
  _LoginForm({
    Key key,
    @required this.loginController,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTabBar(),
        CustomTextFormField(hintText: "Логин", controller: loginController),
        SizedBox(height: 10),
        CustomTextFormField(hintText: "Пароль", controller: passwordController),
      ],
    );
  }
}
