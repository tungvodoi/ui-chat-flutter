import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/Chat.dart';
import 'package:chat/screens/chats/components/chat_card.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              SizedBox(width: kDefaultPadding),
              FillOutlineButton(press: () {}, text: "Active", isFilled: false)
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, i) => ChatCard(
              chat: chatsData[i],
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessagesScreen()))),
          itemCount: chatsData.length,
        ))
      ],
    );
  }
}
