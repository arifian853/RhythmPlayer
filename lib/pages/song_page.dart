import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rhythm_player/models/music_play_model.dart';
import 'package:rhythm_player/widget/player_buttons.dart';
import 'package:rhythm_player/widget/seek_bar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  Music music = Get.arguments ?? Music.musics[0];

  @override
  void initState() {
    super.initState();

    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${music.url}'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Color.fromRGBO(12, 12, 12, 0.6)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBarMusic(),
        // bottomNavigationBar: const _CustomNavBarMusic(),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _MusicPlayer(
                music: music,
                seekBarDataStream: _seekBarDataStream,
                audioPlayer: audioPlayer,
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

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({
    required this.music,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  }) : _seekBarDataStream = seekBarDataStream;

  final Music music;
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 15, right: 20, left: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: AssetImage(music.posterUrl),
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(music.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 5,
          ),
          Text(
            music.artist,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<SeekBarData>(
            stream: _seekBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChangeEnd: audioPlayer.seek,
              );
            },
          ),
          PlayerButtons(audioPlayer: audioPlayer)
        ],
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
            margin: const EdgeInsets.only(
              right: 20, top: 20
            ),
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
