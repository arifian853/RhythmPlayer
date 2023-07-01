import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: () {},
              iconSize: 25,
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.white,
              ),
            );
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: audioPlayer.seekToPrevious,
              iconSize: 45,
              icon: const Icon(
                Icons.skip_previous,
                color: Colors.white,
              ),
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState = playerState!.processingState;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  width: 64,
                  height: 64,
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                );
              } else if (!audioPlayer.playing) {
                return IconButton(
                  onPressed: audioPlayer.play,
                  iconSize: 75,
                  icon: const Icon(Icons.play_circle),
                  color: const Color.fromRGBO(36, 131, 21, 1),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  onPressed: audioPlayer.pause,
                  iconSize: 75,
                  icon: const Icon(Icons.pause_circle),
                  color: const Color.fromRGBO(36, 131, 21, 1),
                );
              } else {
                return IconButton(
                  onPressed: () => audioPlayer.seek(Duration.zero,
                      index: audioPlayer.effectiveIndices!.first),
                  iconSize: 75,
                  icon: const Icon(Icons.replay_circle_filled_outlined),
                  color: const Color.fromRGBO(36, 131, 21, 1),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: audioPlayer.seekToNext,
              iconSize: 45,
              icon: const Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
            );
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: () => audioPlayer.seek(Duration.zero,
                  index: audioPlayer.effectiveIndices!.first),
              iconSize: 25,
              icon: const Icon(
                Icons.replay,
                color: Colors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}
