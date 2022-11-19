import 'package:chatbook/data/data.dart';
import 'package:chatbook/models/user_model.dart';
import 'package:chatbook/widgets/profile_avatar.dart';
import 'package:chatbook/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactList extends StatelessWidget {
  final List<User> onlineUsers;
  ContactList(this.onlineUsers);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Contacts",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              )),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              SizedBox(
                width: 8.0,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(user: onlineUsers[index]),
                );
              },
              itemCount: onlineUsers.length,
            ),
          )
        ],
      ),
    );
  }
}
