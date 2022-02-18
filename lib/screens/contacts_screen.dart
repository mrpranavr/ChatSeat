import 'package:flutter/material.dart';
import 'package:onionchatflutter/model/chat_info.dart';
import 'package:onionchatflutter/constants.dart';
import 'package:onionchatflutter/widgets/nav_drawer.dart';
import 'package:provider/provider.dart';

import '../widgets/chat_cards.dart';

class ContactsScreen extends StatefulWidget {
  static const routeName = '/contacts';

  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 40, 15, 10),
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
              child: Consumer<ChatCardsinfo>(
                builder: ((context, value, child) {
                  return ListView.builder(
                    itemCount: value.chatInfo.length,
                    itemBuilder: (context, index) {
                      String name = value.chatInfo[index].name;
                      String latestMessage =
                          value.chatInfo[index].latestMessage;
                      String imageUrl = value.chatInfo[index].imageUrl;
                      int unreadMessages =
                          value.chatInfo[index].unreadMessageCounter;
                      return ChatCards(
                          name: name,
                          latestMessage: latestMessage,
                          imageUrl: imageUrl,
                          unreadMessages: unreadMessages);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          print('Add new contacts here');
        },
        child: Image.asset('Assets/Icons/AddContacts.png'),
      ),
    );
  }
}
