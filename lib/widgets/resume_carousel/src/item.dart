import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motiv_hackathon_app/blocs/carousel_bloc.dart';
import 'package:motiv_hackathon_app/data/api/real/config.dart';
import 'package:motiv_hackathon_app/models/job_seeker_user.dart';
import 'package:motiv_hackathon_app/theme/design/design_theme.dart';

import 'opened_item_field.dart';

class ResumeCarouselItem extends StatelessWidget {
  const ResumeCarouselItem({
    Key key,
    @required this.user,
    @required this.carouselBloc,
  }) : super(key: key);

  final JobSeekerUser user;
  final CarouselBloc carouselBloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => carouselBloc.isOpened = !carouselBloc.isOpened,
      child: !carouselBloc.isOpened
          ? _buildClosedContainer(context)
          : _buildOpenedContainer(context),
    );
  }

  Widget _buildOpenedContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(ServerConfig.serverPath + user.image),
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  Widget _buildClosedContainer(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .9 - 10,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(ServerConfig.serverPath + user.image),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .9 - 10,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomLeft,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                stops: [0.0, 1.0],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${user.name}, ${user.age}г.",
                    style:
                        DesignTheme.carouselTitleWhite.copyWith(fontSize: 20),
                  ),
                  user.salary != null
                      ? Column(
                          children: [
                            SizedBox(height: 5),
                            ItemOpenedField(
                              text: "${user.salary}р",
                              icon: FontAwesomeIcons.rubleSign,
                            ),
                          ],
                        )
                      : Container(),
                  user.education != null
                      ? Column(
                          children: [
                            SizedBox(height: 5),
                            ItemOpenedField(
                              text: "${user.education}",
                              icon: FontAwesomeIcons.university,
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
