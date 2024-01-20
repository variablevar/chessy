import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      required this.username,
      required this.profile,
      required this.score});
  final String username;
  final String profile;
  final int score;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(username),
      subtitle: Text('($score)'),
      trailing: const SizedBox(
        width: 100,
        child: Chip(
            label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.alarm),
            Text("00:00"),
          ],
        )),
      ),
    );
  }
}
