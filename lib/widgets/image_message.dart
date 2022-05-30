import 'package:flutter/material.dart';
import 'package:onionchatflutter/constants.dart';
import 'package:photo_view/photo_view.dart';

class ImageMessage extends StatelessWidget {
  final String sendType;
  final String url;
  final String time;

  const ImageMessage(
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
              decoration: BoxDecoration(
                gradient: messageBoxGradient,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return FocusImage(
                      url: url,
                    );
                  }));
                  print('download and view image');
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
                  child: Image.network(url),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              time,
              style: messageTimeStyle,
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      );
    } else {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 300),
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 13),
              decoration: const BoxDecoration(
                color: Color(0xffD9D6D6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return FocusImage(
                      url: url,
                    );
                  }));
                  print('download and view image');
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xffB6B3B3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Image.network(url),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              time,
              style: messageTimeStyle,
            ),
          ),
          const SizedBox(
            height: 21,
          )
        ],
      );
    }
  }
}

class FocusImage extends StatelessWidget {
  final String url;
  const FocusImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      child: PhotoView(
        imageProvider: NetworkImage(url),
      ),
    ));
  }
}