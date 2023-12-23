import 'package:erikum_music_player/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../controllers/player_controller.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({super.key});

  @override
  Widget build(BuildContext context) {
    
    var albumController = Get.put(PlayerController());
    return FutureBuilder<<SongModel()>>(future: future, builder: builder)
  }
}
