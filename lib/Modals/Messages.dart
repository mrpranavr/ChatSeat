import 'package:flutter/cupertino.dart';

class Messages extends ChangeNotifier {
  final String type;
  final String sendType;
  final String message;
  final String time;
  final String attachmentUrl;

  Messages({
    required this.type,
    required this.sendType,
    required this.message,
    required this.time,
    required this.attachmentUrl,
  });
}

List<Messages> SpoofMessages = [
  Messages(
    type: 'normal',
    sendType: 'recieve',
    message: 'How are u bro?',
    time: DateTime.now().toString(),
    attachmentUrl: '',
  ),
  Messages(
    type: 'normal',
    sendType: 'sent',
    message: 'I am doing gud. How was the test bro?',
    time: DateTime.now().toString(),
    attachmentUrl: '',
  ),
  Messages(
    type: 'normal',
    sendType: 'recieve',
    message:
        'The test was kinda gud 👍👍.Can u sent the assignment that was given yesterday ?',
    time: DateTime.now().toString(),
    attachmentUrl: '',
  ),
  Messages(
    type: 'normal',
    sendType: 'sent',
    message: 'Ya bro sure, just wait a second.',
    time: DateTime.now().toString(),
    attachmentUrl: '',
  ),
  Messages(
    type: 'attachment',
    sendType: 'sent',
    message: '',
    time: DateTime.now().toString(),
    attachmentUrl: "Assets/Test_images/dharan.jpg",
  ),
  Messages(
    type: 'normal',
    sendType: 'recieve',
    message:
        'Thanks a lot bro. By the way how was yesterdays class. I couldnt attend due to some personal reasons',
    time: DateTime.now().toString(),
    attachmentUrl: '',
  ),
  Messages(
    type: 'normal',
    sendType: 'sent',
    message: 'It was good bro. There were not much important topics.',
    time: DateTime.now().toString(),
    attachmentUrl: '',
  ),
  Messages(
    type: 'normal',
    sendType: 'sent',
    message: 'No worries',
    time: DateTime.now().toString(),
    attachmentUrl: '',
  ),
];
