import 'message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder(
            stream: Firestore.instance
                .collection('chat')
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder: (ctx, streamSnapshot) {
              if (streamSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final documents = streamSnapshot.data.documents;
              return ListView.builder(
                reverse: true,
                itemCount: documents.length,
                itemBuilder: (ctx, index) {
                  return MessageBubble(
                    message: documents[index]['text'],
                    isMe: userSnapshot.data.uid == documents[index]['userId'],
                    key: ValueKey(documents[index].documentID),
                    username: documents[index]['username'],
                  );
                },
              );
            },
          );
        });
  }
}
