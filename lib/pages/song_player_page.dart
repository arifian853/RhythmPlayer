import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rhythm_player/controller/player_controller.dart';

class SongPlayerPage extends StatelessWidget {
  final SongModel data;
  const SongPlayerPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Color.fromRGBO(12, 12, 12, 0.6)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBarMusic(),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 15, right: 20, left: 20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: QueryArtworkWidget(
                        id: data.id,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: const Image(
                          image: AssetImage('assets/images/cover-default.png'),
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(data.displayNameWOExt,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.artist.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            controller.position.value,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          Expanded(
                            child: Slider(
                              min: const Duration(seconds: 0)
                                  .inSeconds
                                  .toDouble(),
                              max: controller.max.value,
                              value: controller.value.value,
                              onChanged: (newValue) {
                                controller
                                    .changeDurationToSeconds(newValue.toInt());
                              },
                              thumbColor: const Color.fromRGBO(36, 131, 21, 1),
                              activeColor: const Color.fromRGBO(36, 131, 21, 1),
                              inactiveColor:
                                  const Color.fromARGB(255, 15, 65, 7),
                            ),
                          ),
                          Text(
                            controller.duration.value,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed(
                              '/favourite',
                            );
                          },
                          iconSize: 25,
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 45,
                          icon: const Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                          ),
                        ),
                        Obx(
                          () => IconButton(
                            onPressed: () {
                              if (controller.isPlaying.value) {
                                controller.audioPlayer.pause();
                                controller.isPlaying(false);
                              } else {
                                controller.audioPlayer.play();
                                controller.isPlaying(true);
                              }
                            },
                            iconSize: 75,
                            icon: controller.isPlaying.value
                                ? const Icon(Icons.pause)
                                : const Icon(Icons.play_circle),
                            color: const Color.fromRGBO(36, 131, 21, 1),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 45,
                          icon: const Icon(
                            Icons.skip_next,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 25,
                          icon: const Icon(
                            Icons.replay,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomAppBarMusic extends StatelessWidget
    implements PreferredSizeWidget {
  const _CustomAppBarMusic();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor:
            Color.fromRGBO(36, 131, 21, 1), // Navigation bar
        statusBarColor: Color.fromRGBO(36, 131, 21, 1),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20),
        child: InkWell(
            onTap: () {
              Get.toNamed(
                '/home',
              );
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      actions: [
        InkWell(
          onTap: () {
            Get.toNamed(
              '/profile',
            );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20, top: 20),
            child: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.person_outlined)),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
