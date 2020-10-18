import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/theme/design/design_theme.dart';

class ItemClosedField extends StatelessWidget {
  const ItemClosedField({
    Key key,
    @required this.text,
    @required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 14,
        ),
        SizedBox(width: 4),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: AutoSizeText(
            text,
            style: DesignTheme.carouselFieldBlack,
            maxLines: null,
            minFontSize: 12,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
