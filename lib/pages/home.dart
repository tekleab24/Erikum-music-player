// ignore_for_file: deprecated_member_use

import 'package:erikum_music_player/constants/colors.dart';
import 'package:erikum_music_player/constants/text_style.dart';
import 'package:erikum_music_player/controllers/player_controller.dart';
import 'package:erikum_music_player/pages/song_list_page.dart';
import 'package:erikum_music_player/widgets/carausel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(PlayerController());

    return Scaffold(
        backgroundColor: darkColor,
        appBar: appBar(context),
        body: const Body(),
        bottomNavigationBar:
            BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              tooltip: 'eeee',
              backgroundColor: darkColor,
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: secondaryColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.yellow,
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                color: secondaryColor,
              ),
              label: 'Artists'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/music.svg',
                color: secondaryColor,
              ),
              label: 'Album'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                color: secondaryColor,
              ),
              label: 'Settings'),
        ]));
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Ekrikum',
            style: myTextStyle(
              color: accentColor,
              family: roboto,
              size: 22,
            )),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
              width: 39,
              margin: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                color: secondaryColor,
                height: 24,
                width: 24,
              )),
        )
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlbumList(),
        ArtistList(),
        PlaylistList()
      ],
    );
  }
}
