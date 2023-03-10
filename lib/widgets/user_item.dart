import 'package:flutter/material.dart';
import 'package:new_project/models/user_model.dart';

class UserItem extends StatelessWidget {
  final UserModel userModel;
  const UserItem({Key? key,required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Card(
          child: userModel.image== null?
          Image.asset('images/person.png',width: 50,height: 50,fit: BoxFit.cover,):
          Image.network(userModel.image!,width: 50,height: 50,fit: BoxFit.cover,)
        ),
      ),
      title: Text(userModel.name??userModel.email),
      subtitle: Text(userModel.available ? 'online':'offline',
        style: TextStyle(
        color: userModel.available? Colors.amber: Colors.grey
      ),
      ),
    );
  }
}
