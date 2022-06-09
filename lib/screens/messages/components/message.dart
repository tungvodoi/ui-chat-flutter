import 'package:chat/constants.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:chat/screens/messages/components/audio_message.dart';
import 'package:chat/screens/messages/components/message_status_dot.dart';
import 'package:chat/screens/messages/components/text_message.dart';
import 'package:chat/screens/messages/components/video_message.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({Key key, @required this.message}) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
          break;
        case ChatMessageType.audio:
          return AudioMessage(message: message);
          break;
        case ChatMessageType.video:
          return VideoMessage(message: message);
          break;
        default:
          return SizedBox();
      }
    }

    return Padding(
        padding: const EdgeInsets.only(top: kDefaultPadding),
        child: Row(
          mainAxisAlignment: message.isSender
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            if (!message.isSender) ...[
              CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage('assets/images/user_2.png'),
              ),
              SizedBox(width: kDefaultPadding / 2)
            ],
            messageContaint(message),
            if (message.isSender)
              MessageStatusDot(status: message.messageStatus)
          ],
        ));
  }
}
