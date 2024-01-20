import 'package:chessy/app/modules/board/widgets/board.dart';
import 'package:chessy/app/modules/board/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/board_controller.dart';

class BoardView extends GetView<BoardController> {
  const BoardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PLAY'),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            UserCard(username: 'Jassica', profile: '', score: 818),
            ChessBoard(),
            UserCard(username: 'Alex', profile: '', score: 895),
          ],
        ));
  }
}
