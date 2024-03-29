import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt', descending: true).snapshots(),
      builder: (context, chatSnapshots) {
        if (chatSnapshots.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
          return const Center(
            child: Text('No messages yet!'),
          );
        }

        if (chatSnapshots.hasError) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }

        final chatDocs = chatSnapshots.data!.docs;
        return ListView.builder(
            padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              final chatMessage = chatDocs[index].data();
              final nextChatMessage = index + 1 < chatDocs.length ? chatDocs[index + 1].data() : null;

              final currentMessageUserId = chatMessage['userId'];
              final nextMessageUserId = nextChatMessage != null ? nextChatMessage['userId'] : null;
              final nextUserIsSame = currentMessageUserId == nextMessageUserId;
              final isMe = authenticatedUser!.uid == currentMessageUserId;

              if (nextUserIsSame) {
                return MessageBubble.next(message: chatMessage['text'], isMe: isMe);
              } else {
                return MessageBubble.first(
                    userImage: chatMessage['userImage'],
                    username: chatMessage['username'],
                    message: chatMessage['text'],
                    isMe: isMe);
              }
            });
      },
    );
  }
}
