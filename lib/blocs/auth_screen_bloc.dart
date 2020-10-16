import 'package:flutter/widgets.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';

class AuthScreenBloc extends ChangeNotifier {
  AuthPages _selectedPage = AuthPages.Login;

  AuthPages get selectedPage => _selectedPage;
  set selectedPage(AuthPages val) {
    _selectedPage = val;
    notifyListeners();
  }
}
