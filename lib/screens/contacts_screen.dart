import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onionchatflutter/constants.dart';
import 'package:onionchatflutter/screens/chat_screen.dart';
import 'package:onionchatflutter/viewmodel/channels_bloc.dart';
import 'package:onionchatflutter/widgets/nav_drawer.dart';

import '../widgets/add_contact_dialog.dart';
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

  @override
  void initState() {
    BlocProvider.of<ChannelsBloc>(context).add(InitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
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
            TextField(
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                hintText: 'Add new user here',
                fillColor: Color(0xffE5E5E5),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: text_field_color, width: 3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              controller: _userID,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<ChannelsBloc, ChannelsState>(
                  builder: (ctx, bloc) {
                if (bloc is LoadedState) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount:
                        bloc.channels.length + (bloc.completedLoading ? 0 : 1),
                    itemBuilder: (context, index) {
                      if (!bloc.completedLoading &&
                          index >= bloc.channels.length) {
                        BlocProvider.of<ChannelsBloc>(context)
                            .add(FetchEvent());
                        return const CircularProgressIndicator();
                      }
                      final ch = bloc.channels[index];
                      String name = ch.name;
                      String latestMessage = ch.lastMessage ?? "-";
                      String imageUrl = ch.avatarFilePath;
                      int unreadMessages = ch.unreadCount ?? 0;
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(ChatScreen.routeName,
                              arguments: ChatScreenArguments(
                                  name, imageUrl, name, widget.selfUserId));
                        },
                        child: ChatCards(
                            name: name,
                            latestMessage: latestMessage,
                            imageUrl: imageUrl,
                            unreadMessages: unreadMessages),
                      );
                    },
                  );
                }
                return const CircularProgressIndicator();
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) => contact(context),
          // );
          BlocProvider.of<ChannelsBloc>(context)
              .add(CreateChannelEvent(_userID.text));
          if (kDebugMode) {
            print('Add new contacts here');
          }

          _userID.clear();
          FocusScope.of(context).requestFocus(new FocusNode());
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
