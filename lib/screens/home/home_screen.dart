import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/widgets/resume_carousel/resume_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResumeCarousel(),
    );
  }
}
