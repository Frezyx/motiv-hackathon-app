import 'package:flutter/widgets.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';

class LaunchNavigatorBloc extends ChangeNotifier {
  LaunchPages _selectedPage = LaunchPages.Home;

  get selectedPage => _selectedPage;
  initPage(LaunchPages val) => _selectedPage = val;

  set selectedPage(LaunchPages val) {
    _selectedPage = val;
    notifyListeners();
  }
}
