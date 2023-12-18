import 'package:ch_2/ios_screen/call1.dart';
import 'package:ch_2/ios_screen/chats1.dart';
import 'package:ch_2/ios_screen/man1.dart';
import 'package:ch_2/ios_screen/settings1.dart';
import 'package:ch_2/provider/platformprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home1 extends StatefulWidget {
  home1({Key? key}) : super(key: key);

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  List<Widget> _tabViews = [
    man1(),
    chats1(),
    call1(),
    setting1(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          
            trailing: CupertinoSwitch(
                value: Provider.of<platformprovider>(context, listen: true)
                    .Plat
                    .isios,
                onChanged: (val) {
                  Provider.of<platformprovider>(context, listen: false)
                      .changePlatform(val);
                })),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_add),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble),
                label: 'Recents',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                label: 'Keypad',
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
              builder: (BuildContext context) => _tabViews[index],
            );
          },
        ));
  }
}
