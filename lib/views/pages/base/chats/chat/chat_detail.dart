import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../domains/entities/chat/chat_entity.dart';

class Chat extends StatefulWidget {
  final String? title;
  final ChatsEntity? user;

  Chat({
    this.title = "",
    super.key,
  }) : user = ChatsEntity(
          userImage: "assets/images/chats.png",
          userName: "Jenny Wilson",
          message: [
            "I have booked your house ...",
            "Hi, morning too Andrew!",
            "Yes, I have received your order. I will come on that date! 😁😁",
          ],
          time: DateTime.now(),
          unreadMessage: 2,
        );

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;
  TextEditingController controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        title: Text(widget.title ?? "Jenny Wilson"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BubbleNormalImage(
                  id: 'id001',
                  image: _image(),
                  // color: Colors.purpleAccent,
                  tail: true,
                  delivered: true,
                ),
                BubbleNormalAudio(
                  color: const Color(0xFFE8E8EE),
                  duration: duration.inSeconds.toDouble(),
                  position: position.inSeconds.toDouble(),
                  isPlaying: isPlaying,
                  isLoading: isLoading,
                  isPause: isPause,
                  onSeekChanged: _changeSeek,
                  onPlayPauseButtonClick: _playAudio,
                  sent: true,
                ),
                BubbleNormal(
                  text: 'bubble normal with tail',
                  time: "10:00",
                  isSender: false,
                  color: KTColors.mainRed,
                  tail: true,
                  textStyle: ktRegularStyle.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  timeStyle: ktRegularStyle.copyWith(
                      fontSize: 10, color: Colors.white),
                ),
                BubbleNormal(
                  text: 'bubble normal with tail',
                  time: "10:00",
                  isSender: true,
                  color: KTColors.yellow,
                  tail: true,
                  sent: true,
                  textStyle: ktRegularStyle.copyWith(
                    fontSize: 18,
                    color: KTColors.black42,
                  ),
                  timeStyle: ktRegularStyle.copyWith(
                    fontSize: 10,
                    color: KTColors.black42,
                  ),
                ),
                DateChip(
                  date: DateTime(now.year, now.month, now.day - 2),
                  color: Colors.grey.shade300,
                  textStyle: ktSemiBoldStyle.copyWith(
                      color: KTColors.grey75, fontSize: 14),
                ),
                BubbleNormal(
                  text: text,
                  time: "10:00",
                  color: KTColors.yellow,
                  tail: true,
                  sent: true,
                  seen: true,
                  delivered: true,
                  textStyle: ktRegularStyle.copyWith(
                    fontSize: 18,
                    color: KTColors.black42,
                  ),
                  timeStyle: ktRegularStyle.copyWith(
                    fontSize: 10,
                    color: KTColors.black42,
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          MessageBar(
            onSend: (value) {
              log("MESSAGE => $value");
            },
            textController: controller,
            onTextChanged: (value) {
              text = value;
              setState(() {});
            },
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {},
                child: text.isEmpty
                    ? SvgPicture.asset(KTIcons.gallery)
                    : const Icon(
                        Icons.send,
                        color: KTColors.mainRed,
                      ),
              ),
            ),
            voiceButton: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(17)),
              splashColor: Colors.grey.shade400,
              onTap: () {},
              child: SvgPicture.asset(
                KTIcons.voiceMicrophone,
                height: 48,
                width: 48,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 20.0,
        minWidth: 20.0,
      ),
      child: CachedNetworkImage(
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/f/f7/Whatsapp_chatting_outdoor_20180808.jpg',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  void _changeSeek(double value) {
    setState(() {
      audioPlayer.seek(Duration(seconds: value.toInt()));
    });
  }

  void _playAudio() async {
    const url =
        'https://onlinetestcase.com/wp-content/uploads/2023/06/500-KB-MP3.mp3';
    if (isPause) {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      await audioPlayer.play(UrlSource(url));
      setState(() {
        isPlaying = true;
        // isLoading = false;
      });
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
        isLoading = false;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration p) {
      if (mounted) {
        setState(() {
          position = p;
        });
      }
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = const Duration();
        position = const Duration();
      });
    });
  }
}
