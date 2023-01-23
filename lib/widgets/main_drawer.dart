import 'package:flutter/material.dart';
import 'package:new_project/auth/firebase_auth.dart';
import 'package:new_project/pages/chat_room_page.dart';
import 'package:new_project/pages/launcher_page.dart';
import 'package:new_project/pages/profile_page.dart';
import 'package:new_project/pages/user_list_page.dart';
import 'package:new_project/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
          ),
          ListTile(
            onTap: ()=>Navigator.pushReplacementNamed(context, ProfilePage.routeName),
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: ()=>Navigator.pushReplacementNamed(context, UserListPage.routeName),
            leading: const Icon(Icons.group),
            title: const Text('User List'),
          ),
          ListTile(
            onTap: ()=>Navigator.pushReplacementNamed(context, ChatRoomPage.routeName),
            leading: const Icon(Icons.chat),
            title: const Text('Chat Room'),
          ),
          ListTile(
            onTap: () async{
              await Provider.of<UserProvider>(context,listen: false)
                  .updateProfile(AuthService.user!.uid, {'available': false});
              AuthService.logOut()
                  .then((value) =>
                  Navigator.pushReplacementNamed(context, LauncherPage.routeName));
            },
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
          )
        ],
      ),
    );
  }
}
