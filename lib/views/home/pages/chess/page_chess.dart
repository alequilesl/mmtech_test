import 'package:flutter/material.dart';
import 'package:mmtech_test/repository/chess_repository.dart';
import 'package:mmtech_test/views/home/pages/chess/widgets/player_card.dart';

class PageChess extends StatefulWidget {
  const PageChess({super.key});

  @override
  State<PageChess> createState() => _PageChessState();
}

class _PageChessState extends State<PageChess> with AutomaticKeepAliveClientMixin{

  List<String> GMs= [];
  bool loading= true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, ()async{
      GMs= await ChessRepository.getAllGMPlayer();
      print('GMs: $GMs');
      setState(() {
          loading= false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return
      loading
      ? const Center(child: CircularProgressIndicator(),)
      : GridView.count(
        crossAxisCount: MediaQuery.of(context).orientation ==  Orientation.portrait ? 3 : 4,
        children: GMs.map((e) => PlayerCard(player: e)).toList(),
      );
  }
  @override
  bool get wantKeepAlive => true;
}
