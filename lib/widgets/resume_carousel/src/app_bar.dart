import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/theme/design/design_theme.dart';

class CarouselAppBar extends StatelessWidget {
  const CarouselAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => print("profile"),
              child: Container(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: DesignTheme.mainColor,
                ),
              ),
            ),
          ),
        ),
        Text("Водитель"),
        SizedBox(
          width: MediaQuery.of(context).size.width * .2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => print("profile"),
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.menu,
                    size: 30,
                    color: DesignTheme.mainColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () => print("profile"),
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    size: 30,
                    color: DesignTheme.mainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
