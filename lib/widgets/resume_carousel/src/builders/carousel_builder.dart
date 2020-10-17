import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/blocs/carousel_bloc.dart';

import '../item.dart';

class CarouselBuilder extends StatelessWidget {
  const CarouselBuilder({
    Key key,
    @required this.carouselBloc,
  }) : super(key: key);

  final CarouselBloc carouselBloc;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselBloc.users.length,
      carouselController: carouselBloc.controller,
      itemBuilder: (context, i) {
        return ResumeCarouselItem(
          user: carouselBloc.users[i],
          carouselBloc: carouselBloc,
        );
      },
      options: CarouselOptions(
        initialPage: 0,
        height: carouselBloc.isOpened
            ? MediaQuery.of(context).size.height * .4
            : MediaQuery.of(context).size.height * .6,
        autoPlay: false,
        enableInfiniteScroll: false,
        viewportFraction: carouselBloc.isOpened ? 1 : .9,
        autoPlayCurve: Curves.elasticIn,
        onPageChanged: (index, reason) {
          carouselBloc.selectedIndex = index;
        },
      ),
    );
  }
}
