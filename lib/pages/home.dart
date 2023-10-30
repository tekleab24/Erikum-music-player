// ignore_for_file: deprecated_member_use

import 'package:erikum_music_player/constants/colors.dart';
import 'package:erikum_music_player/constants/text_style.dart';
import 'package:erikum_music_player/controllers/player_controller.dart';
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
    var controller = Get.put(PlayerController());

    return FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
            ignoreCase: true,
            orderType: OrderType.ASC_OR_SMALLER,
            sortType: null,
            uriType: UriType.EXTERNAL),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.isEmpty) {
            return Text(
              "No music available",
              style: myTextStyle(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 20,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      tileColor: Color.fromARGB(255, 30, 30, 30),
                      title: Text(
                        "Music name",
                        style: myTextStyle(
                            color: whiteColor, family: roboto, size: 16),
                      ),
                      subtitle: Text(
                        "Artist name",
                        style: myTextStyle(
                            color: whiteColor, family: roboto, size: 14),
                      ),
                      leading: SvgPicture.asset(
                        'assets/icons/music.svg',
                        color: secondaryColor,
                        width: 36,
                        height: 36,
                      ),
                      trailing: SvgPicture.asset(
                        'assets/icons/play.svg',
                        color: secondaryColor,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}
