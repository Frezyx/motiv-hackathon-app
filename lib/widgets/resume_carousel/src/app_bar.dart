import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/screens/filters/filters_screen.dart';
import 'package:motiv_hackathon_app/screens/profile/profile_screen.dart';
import 'package:motiv_hackathon_app/theme/design/design_theme.dart';

class CarouselAppBar extends StatelessWidget {
  const CarouselAppBar({
    Key key,
  }) : super(key: key);

  _openHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  }

  _openFiltersScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FiltersScreen()),
    );
  }

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
              onTap: () => _openHomeScreen(context),
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
        Text("Водитель", style: DesignTheme.appBarText),
        SizedBox(
          width: MediaQuery.of(context).size.width * .2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => print("change view state"),
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
                onTap: () => _openFiltersScreen(context),
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
