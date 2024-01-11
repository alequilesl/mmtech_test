import 'package:flutter/material.dart';
import 'package:mmtech_test/models/chess_player.dart';
import 'package:mmtech_test/repository/chess_repository.dart';
import 'package:mmtech_test/routes/routes.dart';

class PlayerCard extends StatefulWidget {
  final String player;

  const PlayerCard({super.key, required this.player});

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  ChessPlayerProfile? profile;


  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, ()async{
      profile= await ChessRepository.getPlayerProfile(widget.player);

      if(profile == null){
        Future.delayed(const Duration(seconds: 3), ()async{
          profile= await ChessRepository.getPlayerProfile(widget.player);
          if(profile != null){
            setState(() {
            });
          }
        });
      }else{
        setState(() {
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    final icon= Center(
        child: Icon(
          Icons.account_circle_outlined,
          color: Colors.deepPurple.withOpacity(0.3),
          size: MediaQuery.of(context).size.width/5,
        ));
    if(profile == null){
      return icon;
    }
    Widget photo;
    if(profile!.avatar == null){
      photo= icon;
    }else{
      photo= Image.network(
        profile!.avatar!,
        errorBuilder: (_, __, ___) => icon,
      );
    }
    return InkWell(
      onTap: profile != null ? () => Navigator.pushNamed(context, RouteName.chess_player_profile, arguments: profile) : null,
      child: Card(
        child: Stack(
          children: [
            Hero(tag: widget.player, child: photo),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
                child: Text(profile!.name, style: const TextStyle(color: Colors.white),),),
            )
          ],
        ),
      ),
    );
  }
}
