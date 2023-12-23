import 'package:erikum_music_player/constants/colors.dart';
import 'package:erikum_music_player/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkColorFG,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SvgPicture.asset('assets/icons/heart.svg',
                  height: 150, width: 150),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                child: Text(
                  'dassssta',
                  style: myTextStyle(
                      color: accentColor,
                      size: 25,
                      weight: FontWeight.w500,
                      family: roboto),
                ),
              )
            ],
          ),
          // const Text("Album name")
        ],
      ),
    );
  }
}
