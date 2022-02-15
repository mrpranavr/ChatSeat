import 'package:flutter/material.dart';
import 'package:onionchatflutter/constants.dart';

class Attachment_message extends StatelessWidget {
  final String sendType;
  final String url;
  final String time;
  const Attachment_message(
      {Key? key, required this.sendType, required this.url, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sendType == 'sent') {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 300),
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 13),
              decoration: const BoxDecoration(
                color: heading_color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  print('download and view attachment');
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xff822FAF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset('Assets/Icons/FileIcon.png'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        url.split('/').last,
                        style: const TextStyle(
                          fontFamily: FontFamily_main,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(alignment: Alignment.centerRight, child: Text(time)),
          const SizedBox(
            height: 20,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
