import 'package:flutter/material.dart';
import 'package:onionchatflutter/Modals/Chat_info.dart';
import 'package:onionchatflutter/constants.dart';
import 'package:onionchatflutter/widgets/Nav_drawer.dart';

import '../widgets/Chat_cards.dart';

class AllChatsScreen extends StatefulWidget {
  static const routeName = '/AllChats';

  const AllChatsScreen({Key? key}) : super(key: key);

  @override
  _AllChatsScreenState createState() => _AllChatsScreenState();
}

class _AllChatsScreenState extends State<AllChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav_drawer(),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 35, 15, 10),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                          print('Nav Drawer');
                        },
                        child: Image.asset('Assets/Icons/NavDrawerIcon.png'));
                  }),
                  const Text(
                    'Chats',
                    style: TextStyle(
                        fontFamily: FontFamily_main,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: heading_color),
                  ),
                  const CircleAvatar(
                    radius: 30,
                    foregroundImage: AssetImage('Assets/Test_images/vshnv.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chatsInfo.length,
                itemBuilder: (context, index) {
                  String name = chatsInfo[index].name;
                  String latestMessage = chatsInfo[index].latestMessage;
                  String imageUrl = chatsInfo[index].imageUrl;
                  int unreadMessages = chatsInfo[index].unreadMessageCounter;
                  return ChatCards(
                      name: name,
                      latestMessage: latestMessage,
                      imageUrl: imageUrl,
                      unreadMessages: unreadMessages);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
