import 'package:flutter/material.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';

class myDrawer extends StatefulWidget {
  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  String _redTicket = '0';
  String _yellowTicket = '0';
  String _blueTicket = '0';
  String _greenTicket = '0';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: HexColor('#222222'), //globals.blue1,
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView(
            controller: ScrollController(),
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'Assets/HomePage/ProfilePicture/img1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  _redTicket,
                                  style: TextStyle(
                                    color: HexColor('#ec3227'),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Image(
                                  image: AssetImage('Assets/Tickets/redTicket.png'),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                Text(
                                  _yellowTicket,
                                  style: TextStyle(
                                    color: HexColor('#f3b70c'),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Image(
                                  image:
                                  AssetImage('Assets/Tickets/yellowTicket.png'),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                Text(
                                  _blueTicket,
                                  style: TextStyle(
                                    color: HexColor('#5576c3'),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Image(
                                  image: AssetImage('Assets/Tickets/blueTicket.png'),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                Text(
                                  _greenTicket,
                                  style: TextStyle(
                                    color: HexColor('#37ae44'),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Image(
                                  image: AssetImage('Assets/Tickets/greenTicket.png'),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),
                        const SearchFieldDrawer(),
                        const SizedBox(height: 12),
                        MenuItem(
                          text: 'My Courses',
                          icon: Icons.menu_book,
                          color: Colors.red,
                          onClicked: () => selectedItem(context, 0),
                        ),
                        const SizedBox(height: 5),
                        MenuItem(
                          text: 'Liked Courses',
                          icon: Icons.favorite_border,
                          color: Colors.yellow,
                          onClicked: () => selectedItem(context, 1),
                        ),
                        const SizedBox(height: 5),
                        MenuItem(
                          text: 'Liked Teachers',
                          icon: Icons.people,
                          color: Colors.blue,
                          onClicked: () => selectedItem(context, 2),
                        ),
                        const SizedBox(height: 5),
                        MenuItem(
                          text: 'Updates',
                          icon: Icons.update,
                          color: Colors.green,
                          onClicked: () => selectedItem(context, 3),
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: Colors.white70),
                        const SizedBox(height: 8),
                        MenuItem(
                          text: 'Notifications',
                          icon: Icons.notifications_outlined,
                          color: globals.whiteBlue,
                          onClicked: () => selectedItem(context, 4),
                        ),
                        MenuItem(
                          text: 'Settings',
                          icon: Icons.settings,
                          color: globals.whiteBlue,
                          onClicked: () => selectedItem(context, 5),
                        ),
                        const SizedBox(height: 8),
                        MenuItem(
                          text: 'Logout',
                          icon: Icons.logout,
                          color: globals.whiteBlue,
                          onClicked: () => selectedItem(context, 6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectedItem(BuildContext context, int index) async {
    Navigator.of(context).pop();
    switch (index) {
      case 0: // My Courses
        if (globals.currentPage != 'MyCourses') {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/MyCourses', (route) => false);
        }
        break;
      case 1: // Liked Courses
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const Scaffold(), // Page 2
        // ));
        break;
      case 2: // Liked Teachers
        if (globals.currentPage != 'LikedTeachersPage') {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/LikedTeachersPage', (route) => false);
        }
        break;
      case 3: // Updates
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const Scaffold(), // Page 4
        // ));
        break;
      case 4: // Notifications
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const Scaffold(), // Page 5
        // ));
        break;
      case 5: // Settings
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const Scaffold(), // Page 6
        // ));
        break;

      case 6: // Logout

        globals.isLoggedIn = false;
        await SessionManager().destroy();

        Navigator.of(context)
            .pushNamedAndRemoveUntil('/HomePage', (route) => false);

        break;
    }
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    required this.color,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Color color = globals.whiteBlue;//Colors.white;
    Color hoverColor = Colors.transparent.withOpacity(1); //Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

class SearchFieldDrawer extends StatelessWidget {
  const SearchFieldDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;

    return TextField(
      style: const TextStyle(color: color, fontSize: 14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(
          Icons.search,
          color: color,
          size: 20,
        ),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }
}
