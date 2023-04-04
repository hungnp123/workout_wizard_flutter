import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatSp extends StatefulWidget {
  const ChatSp({super.key});

  @override
  State<ChatSp> createState() => _ChatSpState();
}

class _ChatSpState extends State<ChatSp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Chat sp'),
    );
  }
}