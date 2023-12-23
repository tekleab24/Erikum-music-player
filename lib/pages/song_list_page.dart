import 'package:erikum_music_player/constants/colors.dart';
import 'package:erikum_music_player/constants/text_style.dart';
import 'package:erikum_music_player/controllers/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongList extends StatelessWidget {
  const SongList({super.key});

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
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 6),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            tileColor: darkColorFG,
                            title: Text(
                              snapshot.data![index].displayNameWOExt,
                              style: myTextStyle(
                                  color: whiteColor, family: roboto, size: 16),
                            ),
                            subtitle: Text(
                              snapshot.data![index].artist.toString(),
                              style: myTextStyle(
                                  color: whiteColor, family: roboto, size: 14),
                            ),
                            leading: QueryArtworkWidget(
                                // artworkHeight: 400,
                                artworkBorder: BorderRadius.zero,
                                id: snapshot.data![index].id,
                                type: ArtworkType.AUDIO),
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
                  ),
                ],
              ),
            );
          }
        });
  }
}
