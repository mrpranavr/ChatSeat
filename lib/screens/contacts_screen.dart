import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_chatData.chatInfo/flutter_chatData.chatInfo.dart';
import 'package:onionchatflutter/constants.dart';
import 'package:onionchatflutter/model/chat_info.dart';
import 'package:onionchatflutter/screens/chat_screen.dart';
import 'package:onionchatflutter/screens/login_screen.dart';
//import 'package:onionchatflutter/viewmodel/channels_chatData.chatInfo.dart';
import 'package:onionchatflutter/widgets/nav_drawer.dart';

import '../widgets/chat_cards.dart';

class ContactsScreen extends StatefulWidget {
  static const routeName = '/contacts';
  final String selfUserId;

  const ContactsScreen({Key? key, required this.selfUserId}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final _userID = TextEditingController();

  ChatCardsinfo chatData = new ChatCardsinfo();

  @override
  void initState() {
    //chatData.chatInfoProvider
    // .of<ChannelschatData.chatInfo>(context)
    // .add(InitEvent());
    super.initState();
  }

  @override
  void activate() {
    super.activate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
        username: widget.selfUserId,
        onLogout: () {
          // chatData.chatInfoProvider
          //     .of<ChannelschatData.chatInfo>(context)
          //     .add(LogoutEvent());
          Navigator.of(context, rootNavigator: true)
              .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
        },
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
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
            SizedBox(
              height: 10,
            ),
            Expanded(
                child:
                    // chatData.chatInfoBuilder<ChannelschatData.chatInfo, ChannelsState>(
                    //     builder: (ctx, chatData.chatInfo) {
                    //   if (chatData.chatInfo is LoadedState) {
                    //     return
                    //     ListView.builder(
                    //       padding: EdgeInsets.zero,
                    //       itemCount:
                    //           chatData.chatInfo.channels.length + (chatData.chatInfo.completedLoading ? 0 : 1),
                    //       itemBuilder: (context, index) {
                    //         if (!chatData.chatInfo.completedLoading &&
                    //             index >= chatData.chatInfo.channels.length) {
                    //           chatData.chatInfoProvider.of<ChannelschatData.chatInfo>(context)
                    //               .add(FetchEvent());
                    //           return const CircularProgressIndicator();
                    //         }
                    //         final ch = chatData.chatInfo.channels[index];
                    //         String name = ch.name;
                    //         String latestMessage = ch.lastMessage ?? "-";
                    //         String imageUrl = ch.avatarFilePath;
                    //         int unreadMessages = ch.unreadCount ?? 0;
                    //         return GestureDetector(
                    //           onTap: () {
                    //             Navigator.of(context)
                    //                 .pushNamed(ChatScreen.routeName,
                    //                     arguments: ChatScreenArguments(
                    //                         name, imageUrl, name, widget.selfUserId))
                    //                 .then((value) {
                    //               chatData.chatInfoProvider.of<ChannelschatData.chatInfo>(context)
                    //                   .add(ChannelClosedEvent(ch));
                    //             });
                    //           },
                    //           child: ChatCards(
                    //               name: name,
                    //               latestMessage: latestMessage,
                    //               imageUrl: imageUrl,
                    //               unreadMessages: unreadMessages),
                    //         );
                    //       },
                    //     );
                    //   //}
                    //   //return const CircularProgressIndicator();
                    // }),

                    ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: chatData.chatInfo.length,
              itemBuilder: (context, index) {
                final ch = chatData.chatInfo[index];
                String name = ch.name;
                String latestMessage = ch.latestMessage ?? "-";
                String imageUrl = ch.imageUrl;
                int unreadMessages = ch.unreadMessageCounter ?? 0;
                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushNamed(ChatScreen.routeName,
                    //     arguments: ChatScreenArguments(
                    //         name, imageUrl, name, widget.selfUserId));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(
                              chatScreenArguments: new ChatScreenArguments(
                                  '1', imageUrl, name, 'test123'))),
                    );
                    //     .then((value) {
                    //   chatData.chatInfoProvider.of<ChannelschatData.chatInfo>(context)
                    //       .add(ChannelClosedEvent(ch));
                    // });
                  },
                  child: ChatCards(
                      name: name,
                      latestMessage: latestMessage,
                      imageUrl: imageUrl,
                      unreadMessages: unreadMessages),
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext c) => AlertDialog(
                    title: const Text(
                      "Add new contact",
                      style: TextStyle(
                        fontFamily: FontFamily_main,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: SizedBox(
                      height: 180,
                      child: Column(
                        children: [
                          const Text(
                            'Enter user ID',
                            style: TextStyle(
                              fontFamily: FontFamily_main,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            scrollPadding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              hintText: 'Enter username',
                              fillColor: Color(0xffE5E5E5),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: text_field_color, width: 3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            controller: _userID,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                // chatData.chatInfoProvider
                                //     .of<ChannelschatData.chatInfo>(context)
                                //     .add(CreateChannelEvent(_userID.text));
                                if (kDebugMode) {
                                  print('Add new contacts here');
                                }
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                Navigator.of(c).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff822FAF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text("Add Contact",
                                  style: TextStyle(
                                    fontFamily: FontFamily_main,
                                  )))
                        ],
                      ),
                    ),
                  ));

          _userID.clear();
        },
        child: Image.asset('Assets/Icons/AddContacts.png'),
      ),
    );
  }
}

/**
 * Consumer<ChatCardsinfo>(
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
    )
 *
 * */
