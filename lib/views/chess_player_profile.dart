import 'package:flutter/material.dart';
import 'package:mmtech_test/models/chess_player.dart' as model;
import 'package:mmtech_test/models/chess_player.dart';
import 'package:mmtech_test/repository/chess_repository.dart';

class ChessPlayerProfile extends StatefulWidget {
  const ChessPlayerProfile({super.key});

  @override
  State<ChessPlayerProfile> createState() => _ChessPlayerProfileState();
}

class _ChessPlayerProfileState extends State<ChessPlayerProfile> {
  ChessPlayerStats? stats;

  model.ChessPlayerProfile get profile => (ModalRoute.of(context)?.settings.arguments as model.ChessPlayerProfile);


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, ()async{
      stats= await ChessRepository.getPlayerStats(profile.username);
      if(stats != null){
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget leading= profile.avatar == null
        ? Icon(
          Icons.account_circle_outlined,
          color: Colors.deepPurple.withOpacity(0.3),
          size: MediaQuery.of(context).size.width/6,
        )
        :CircleAvatar(foregroundImage: NetworkImage(profile.avatar!), radius: MediaQuery.of(context).size.width/12,);

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        children: [
          ListTile(
            title: Text(profile.name),
            subtitle: Text(profile.username),
            leading: Hero(tag: profile.username, child: leading,)
          ),
          if(stats != null) ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Rapid'),
            subtitle: Text('current: ${stats?.rapid.last.rating ?? ''}   best: ${stats?.rapid.best.rating ?? ''}'),
            trailing: Text('+${stats?.rapid.record.win ?? ''}\n=${stats?.rapid.record.draw ?? ''}\n-${stats?.rapid.record.loss ?? ''}'),
          ),
          if(stats != null) ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Blitz'),
            subtitle: Text('current: ${stats?.blitz.last.rating ?? ''}   best: ${stats?.blitz.best.rating ?? ''}'),
            trailing: Text('+${stats?.blitz.record.win ?? ''}\n=${stats?.blitz.record.draw ?? ''}\n-${stats?.blitz.record.loss ?? ''}'),
          ),
          if(stats != null) ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Bullet'),
            subtitle: Text('current: ${stats?.bullet.last.rating ?? ''}   best: ${stats?.bullet.best.rating ?? ''}'),
            trailing: Text('+${stats?.bullet.record.win ?? ''}\n=${stats?.bullet.record.draw ?? ''}\n-${stats?.bullet.record.loss ?? ''}'),
          ),
        ],
      ),
    );
  }
}
