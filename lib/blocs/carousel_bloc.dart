import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselBloc extends ChangeNotifier {
  CarouselController _controller = CarouselController();
  CarouselController get controller => _controller;
}
