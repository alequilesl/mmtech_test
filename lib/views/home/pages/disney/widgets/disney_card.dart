import 'package:flutter/material.dart';
import 'package:mmtech_test/models/disney_character.dart';

class DisneyCard extends StatefulWidget {
  final DisneyCharacter character;
  const DisneyCard({super.key, required this.character});

  @override
  State<DisneyCard> createState() => _DisneyCardState();
}

class _DisneyCardState extends State<DisneyCard> {
  @override
  Widget build(BuildContext context) {
    Widget photo;
    final icon= Center(
        child: Icon(
          Icons.account_circle_outlined,
          color: Colors.deepPurple.withOpacity(0.3),
          size: MediaQuery.of(context).size.width/5,
        ));
    if(widget.character.imageUrl == null){
      photo= icon;
    }else{
      photo= Image.network(
        widget.character.imageUrl!,
        errorBuilder: (_, __, ___) => icon,
      );
    }

    return Card(
      child: Stack(
        children: [
          Hero(tag: widget.character.id, child: photo),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
              child: Text(widget.character.name, style: const TextStyle(color: Colors.white),),),
          )
        ],
      ),
    );
  }
}
