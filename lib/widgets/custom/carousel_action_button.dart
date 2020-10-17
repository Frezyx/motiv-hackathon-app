import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/blocs/carousel_bloc.dart';
import 'package:motiv_hackathon_app/theme/design/design_theme.dart';
import 'package:motiv_hackathon_app/utils/enums.dart';
import 'package:provider/provider.dart';

class CarouselActionButton extends StatelessWidget {
  const CarouselActionButton({
    Key key,
    @required this.buttonState,
  }) : super(key: key);

  final CarouselButtonState buttonState;

  @override
  Widget build(BuildContext context) {
    final carouselBloc = Provider.of<CarouselBloc>(context);
    return Container(
      decoration: BoxDecoration(boxShadow: [DesignTheme.resumeButtonsShadow]),
      child: ClipOval(
        child: Material(
          color: Colors.white,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: buttonState == CarouselButtonState.Decline
                ? Colors.red[300]
                : Colors.green[300],
            child: SizedBox(
              width: 56,
              height: 56,
              child: Icon(
                buttonState == CarouselButtonState.Decline
                    ? Icons.close
                    : Icons.favorite_outline_rounded,
                color: buttonState == CarouselButtonState.Decline
                    ? Colors.red[800]
                    : Colors.green[800],
              ),
            ),
            onTap: () {
              //todo: Активность в зависимости от action
              carouselBloc.controller.nextPage();
            },
          ),
        ),
      ),
    );
  }
}
