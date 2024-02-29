import 'package:flutter/material.dart';
import 'package:klassrum_web/secrets.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CallArguments;

    return ZegoUIKitPrebuiltCall(
      appID: appID,
      appSign: appSign,
      userID: args.uid,
      userName: args.username,
      callID: args.callID,
      config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
    );
  }
}

class CallArguments {
  final String uid;
  final String username;
  final String callID;

  CallArguments(this.uid, this.username, this.callID);
}
