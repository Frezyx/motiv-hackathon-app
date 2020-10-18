import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motiv_hackathon_app/blocs/carousel_bloc.dart';
import 'package:motiv_hackathon_app/data/prepare/prepare.dart';
import 'package:motiv_hackathon_app/models/job_seeker_user.dart';
import 'package:motiv_hackathon_app/theme/design/design_theme.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';
import 'package:motiv_hackathon_app/widgets/custom/carousel_action_button.dart';
import 'package:motiv_hackathon_app/widgets/resume_carousel/src/app_bar.dart';
import 'package:motiv_hackathon_app/widgets/resume_carousel/src/builders/carousel_builder.dart';
import 'package:motiv_hackathon_app/widgets/resume_carousel/src/item.dart';
import 'package:motiv_hackathon_app/widgets/resume_carousel/src/opened_item_field.dart';
import 'package:provider/provider.dart';

import 'src/closed_field.dart';

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
    return !carouselBloc.isOpened
        ? _buildClosedStack(carouselBloc)
        : _buildOpenedStack(carouselBloc);
  }

  Widget _buildOpenedStack(CarouselBloc carouselBloc) {
    final user = carouselBloc.users[carouselBloc.selectedIndex];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 60,
          ).copyWith(bottom: 0),
          child: CarouselAppBar(),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                CarouselBuilder(
                  carouselBloc: carouselBloc,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ).copyWith(left: 45.0),
                  child: Text(
                    "${user.name}, ${user.age}г.",
                    style: DesignTheme.carouselTitleWhite
                        .copyWith(fontSize: 20, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: ItemClosedField(
                    text: "${user.education}",
                    icon: FontAwesomeIcons.university,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: ItemClosedField(
                    text: "${user.abilities}"
                        .replaceAll(']', '')
                        .replaceAll('[', ''),
                    icon: FontAwesomeIcons.palette,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: ItemClosedField(
                    text: "${user.workSchedule}"
                        .replaceAll(']', '')
                        .replaceAll('[', ''),
                    icon: Icons.timer,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: ItemClosedField(
                    text:
                        "${user.workExpTime.split(',')[0]} лет ${user.workExpTime.split(',').length > 1 ? user.workExpTime.split(',')[1] + ' мес.' : ''}",
                    icon: Icons.timer,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: ItemClosedField(
                    text: "${user.languages}"
                        .replaceAll(']', '')
                        .replaceAll('[', ''),
                    icon: FontAwesomeIcons.language,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: ItemClosedField(
                    text: "${user.salary}р",
                    icon: FontAwesomeIcons.rubleSign,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: ItemClosedField(
                    text: "${user.workDescription}",
                    icon: FontAwesomeIcons.info,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: ItemClosedField(
                    text: "${user.aboutPerson}",
                    icon: FontAwesomeIcons.info,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: ItemClosedField(
                    text: "+${user.phone}",
                    icon: FontAwesomeIcons.phone,
                  ),
                ),
                SizedBox(height: 20),
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
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClosedStack(CarouselBloc carouselBloc) {
    return Stack(
      children: [
        Center(
          child: FutureBuilder(
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
                    return CarouselBuilder(carouselBloc: carouselBloc);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
              }
            },
          ),
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
