import 'package:flutter/material.dart';
import 'package:onionchatflutter/constants.dart';
import 'package:onionchatflutter/screens/Chat_screen.dart';

class ChatCards extends StatefulWidget {
  final String name;
  final String latestMessage;
  final String imageUrl;
  final int unreadMessages;
  const ChatCards(
      {Key? key,
      required this.name,
      required this.latestMessage,
      required this.imageUrl,
      required this.unreadMessages})
      : super(key: key);

  @override
  _ChatCardsState createState() => _ChatCardsState();
}

class _ChatCardsState extends State<ChatCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.name);
        Navigator.pushNamed(context, ChatScreen.routeName,
            arguments: {'name': widget.name, 'imageUrl': widget.imageUrl});
      },
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                foregroundImage: AssetImage(widget.imageUrl),
                radius: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontFamily: FontFamily_main,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.latestMessage,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontFamily: FontFamily_main,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff7B7B7B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: widget.unreadMessages > 0,
                child: Container(
                  margin: EdgeInsets.all(18),
                  height: 23,
                  width: 23,
                  decoration: const BoxDecoration(
                    color: accent_pink,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${widget.unreadMessages}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
