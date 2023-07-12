import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythm_player/models/playlist_model.dart';

class PlaylistListCard extends StatelessWidget {
  const PlaylistListCard({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/playlist', arguments: playlist);
      },
      child: Container(
        height: 65,
        margin: const EdgeInsets.only(
            top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            color: const Color.fromARGB(221, 43, 42, 42),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    image: AssetImage(playlist.imageUrl),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playlist.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(playlist.description,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ))
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
