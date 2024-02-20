import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class CallRoomScreen extends StatefulWidget {
  const CallRoomScreen({super.key});

  @override
  State<CallRoomScreen> createState() => _CallRoomScreenState();
}

class _CallRoomScreenState extends State<CallRoomScreen> {
  final _localVideoRenderer = RTCVideoRenderer();
  final _remoteVideoRenderer = RTCVideoRenderer();

  void initRenderers() async {
    await _localVideoRenderer.initialize();
    await _remoteVideoRenderer.initialize();
  }

  @override
  void initState() {
    initRenderers();
    super.initState();
  }

  @override
  void dispose() async {
    await _localVideoRenderer.dispose();
    _getUserMedia();
    super.dispose();
  }

  void _getUserMedia() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': {
        'facingMode': 'user',
      }
    };

    MediaStream stream =
        await navigator.mediaDevices.getUserMedia(mediaConstraints);
    _localVideoRenderer.srcObject = stream;
  }

  SizedBox videoRenderers() => SizedBox(
        height: 210,
        child: Row(children: [
          Flexible(
              child: Container(
            key: const Key('local'),
            margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            decoration: const BoxDecoration(color: Colors.black),
          )),
          Flexible(
              child: Container(
            key: const Key('remote'),
            margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            decoration: const BoxDecoration(color: Colors.black),
          ))
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Session de cours'),
        ),
        body: Stack(children: [
          Positioned(
            top: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: RTCVideoView(_localVideoRenderer),
          )
        ]));
  }
}
