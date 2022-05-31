import 'package:flutter/material.dart';
import 'package:onionchatflutter/constants.dart';

class NavDrawer extends StatefulWidget {
  final String username;
  final void Function() onLogout;
  const NavDrawer({
    Key? key,
    required this.username,
    required this.onLogout
  }) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  // Implement a function to change the profile photo of the user
  // and also the QR buttons and LogOut button

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 50,
        backgroundColor: const Color(0xffF7ECF8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hey there, ',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: FontFamily_main,
                    color: nav_secondary,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                // Replace with the username of the current user.
                widget.username,
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: FontFamily_main,
                    foreground: Paint()..shader = nameHeadingGradient,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 38,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: dark_accent),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('Assets/Test_images/vshnv.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: GestureDetector(
                        onTap: () {
                          print('edit button pressed');
                        },
                        child: Container(
                          padding: EdgeInsets.all(2.0),
                          // color: Theme.of(context).accentColor,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(width: 3, color: dark_accent),
                            image: const DecorationImage(
                              image: AssetImage('Assets/Icons/editIcon.png'),
                            ),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 41,
                            minHeight: 41,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 64,
                thickness: 3,
                color: Color(0xffE2DBE6),
              ),
              TextButton.icon(
                onPressed: () {
                  // Show QR function here
                  print('show QR');
                },
                icon: Image.asset('Assets/Icons/qrIcon.png'),
                label: const Text(
                  'Show QR',
                  style: TextStyle(
                    // add Roboto font here.
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: nav_secondary,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  // Scan QR function here
                  print('Scan QR');
                },
                icon: Image.asset('Assets/Icons/qrIcon.png'),
                label: const Text(
                  'Scan QR',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: nav_secondary,
                  ),
                ),
              ),
              const Divider(
                height: 64,
                thickness: 3,
                color: Color(0xffE2DBE6),
              ),
              TextButton.icon(
                onPressed: widget.onLogout,
                icon: Image.asset('Assets/Icons/LogoutIcon.png'),
                label: const Text(
                  'Log Out',
                  style: TextStyle(
                    // add Roboto font here.
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: nav_secondary,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
