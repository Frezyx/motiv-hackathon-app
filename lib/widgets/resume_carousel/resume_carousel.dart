import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/widgets/resume_carousel/src/item.dart';

class ResumeCarousel extends StatelessWidget {
  const ResumeCarousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CarouselSlider.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              return ResumeCarouselItem();
            },
            options: CarouselOptions(
              initialPage: 0,
              height: 500,
              autoPlay: false,
              enableInfiniteScroll: false,
              viewportFraction: .9,
              autoPlayCurve: Curves.elasticIn,
              onPageChanged: (index, reason) {},
            ),
          ),
        ),
      ],
    );
  }
}
