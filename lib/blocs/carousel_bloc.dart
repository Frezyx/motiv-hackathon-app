import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/models/job_seeker_user.dart';

class CarouselBloc extends ChangeNotifier {
  List<JobSeekerUser> _users;
  int _selectedIndex = 0;
  CarouselController _controller = CarouselController();
  bool _isOpened = false;

  bool get isOpened => _isOpened;
  set isOpened(bool val) {
    _isOpened = val;
    notifyListeners();
  }

  List<JobSeekerUser> get users => _users;
  set users(List<JobSeekerUser> val) {
    _users = val;
    notifyListeners();
  }

  initUsers(List<JobSeekerUser> val) => _users = val;

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }

  CarouselController get controller => _controller;
}
