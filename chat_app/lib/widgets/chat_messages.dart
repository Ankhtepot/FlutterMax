import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key/*, this.messages*/});
  // final List<Message> messages;


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No Messages Found'),
    );
    // return ListView.builder(
    //   itemCount: messages.length,
    //   itemBuilder: (context, index) => messages[index],
    // );
  }
}