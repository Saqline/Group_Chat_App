import 'package:flutter/material.dart';
import 'package:new_project/auth/firebase_auth.dart';
import 'package:new_project/pages/login_page.dart';
import 'package:new_project/pages/profile_page.dart';
import 'package:new_project/pages/user_list_page.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName='/launcher_page';

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      if(AuthService.user==null){
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }else{
        Navigator.pushReplacementNamed(context, UserListPage.routeName);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
