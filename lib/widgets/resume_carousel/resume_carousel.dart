import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/blocs/carousel_bloc.dart';
import 'package:motiv_hackathon_app/data/prepare/prepare.dart';
import 'package:motiv_hackathon_app/models/job_seeker_user.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';
import 'package:motiv_hackathon_app/widgets/custom/carousel_action_button.dart';
import 'package:motiv_hackathon_app/widgets/resume_carousel/src/app_bar.dart';
import 'package:motiv_hackathon_app/widgets/resume_carousel/src/item.dart';
import 'package:provider/provider.dart';

class ResumeCarousel extends StatefulWidget {
  const ResumeCarousel({
    Key key,
  }) : super(key: key);

  @override
  _ResumeCarouselState createState() => _ResumeCarouselState();
}

class _ResumeCarouselState extends State<ResumeCarousel> {
  @override
  void initState() {
    if (this.mounted) {
      setState(() {
        _users = RequestPrepare.getResumesList();
      });
    }
    super.initState();
  }

  Future<List<JobSeekerUser>> _users;
  @override
  Widget build(BuildContext context) {
    final carouselBloc = Provider.of<CarouselBloc>(context);
    return Stack(
      children: [
        FutureBuilder(
          future: _users,
          builder: (BuildContext context,
              AsyncSnapshot<List<JobSeekerUser>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (!snapshot.hasError) {
                  carouselBloc.initUsers(snapshot.data);
                  return Center(
                    child: CarouselSlider.builder(
                      itemCount: carouselBloc.users.length,
                      carouselController: carouselBloc.controller,
                      itemBuilder: (context, i) {
                        return ResumeCarouselItem(
                          user: carouselBloc.users[i],
                        );
                      },
                      options: CarouselOptions(
                        initialPage: 0,
                        height: MediaQuery.of(context).size.height * .6,
                        autoPlay: false,
                        enableInfiniteScroll: false,
                        viewportFraction: .9,
                        autoPlayCurve: Curves.elasticIn,
                        onPageChanged: (index, reason) {
                          carouselBloc.selectedIndex = index;
                        },
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 60,
          ).copyWith(bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselAppBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CarouselActionButton(
                    buttonState: CarouselButtonState.Decline,
                  ),
                  CarouselActionButton(
                    buttonState: CarouselButtonState.Accept,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
