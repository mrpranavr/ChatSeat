import 'package:flutter/material.dart';
import 'package:onionchatflutter/Modals/Messages.dart';
import 'package:onionchatflutter/constants.dart';
import 'package:onionchatflutter/widgets/Attachment_message.dart';
import 'package:onionchatflutter/widgets/Normal_message.dart';
import 'package:onionchatflutter/widgets/Recording_chat.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/ChatScreen';
  // final String name;
  // final String imageUrl;

  const ChatScreen({
    Key? key,
    // required this.name,
    // required this.imageUrl,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration.zero, () {
  //     setState(() {
  //       var args = ModalRoute.of(context)?.settings.arguments;
  //     });
  //     // print(args['name']);
  //     // _yourFunction(args);
  //   });
  // }

  String editTime(String time) {
    var newTime = time.split(' ')[1];
    return newTime;
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: const Color(0xffF7ECF8),
      body: GestureDetector(
        onTap: (() {
          FocusScope.of(context).requestFocus(new FocusNode());
        }),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('Assets/Icons/BackIcon.png'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    radius: 30,
                    foregroundImage: AssetImage(arg['imageUrl']),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      arg['name'],
                      style: const TextStyle(
                        fontFamily: FontFamily_main,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  width: double.infinity,
                  // height: 750,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 16,
                        offset: Offset(0, -5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          // controller: _controller,
                          reverse: true,
                          itemCount: SpoofMessages.length,
                          itemBuilder: (context, index) {
                            final reversedIndex =
                                SpoofMessages.length - 1 - index;
                            String message =
                                SpoofMessages[reversedIndex].message;
                            String time = SpoofMessages[reversedIndex].time;
                            String sendType =
                                SpoofMessages[reversedIndex].sendType;
                            String type = SpoofMessages[reversedIndex].type;
                            String attachmentUrl =
                                SpoofMessages[reversedIndex].attachmentUrl;
                            if (type == 'recording') {
                              return Recording_message();
                            } else if (type == 'attachment') {
                              return Attachment_message(
                                sendType: sendType,
                                url: attachmentUrl,
                                time: editTime(time),
                              );
                            } else {
                              return Normal_message(
                                sendType: sendType,
                                message: message,
                                time: editTime(time),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  child: GestureDetector(
                                    onLongPress: () {
                                      print('Record start');
                                    },
                                    onTap: () {
                                      print('Record start');
                                    },
                                    child: Image.asset(
                                        'Assets/Icons/microphone.png'),
                                  ),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    print('Sent attachment');
                                  },
                                  child: Image.asset(
                                      'Assets/Icons/attachIcon.png'),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                hintText: 'Type something...',
                                fillColor: Color(0xffE5E5E5),
                                filled: true,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: text_field_color, width: 3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              print('message sent');
                            },
                            child: Image.asset('Assets/Icons/Sent button.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
