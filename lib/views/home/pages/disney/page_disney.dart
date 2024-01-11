
import 'package:flutter/material.dart';
import 'package:mmtech_test/models/disney_character.dart';
import 'package:mmtech_test/repository/disney_repository.dart';

import 'widgets/disney_card.dart';

class PageDisney extends StatefulWidget {
  const PageDisney({super.key});

  @override
  State<PageDisney> createState() => _PageDisneyState();
}

class _PageDisneyState extends State<PageDisney> with AutomaticKeepAliveClientMixin{

  List<DisneyCharacter> chararters= [];
  bool loading= true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, ()async{
      chararters= await DisneyRepository.getDisneyCharecters();
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
      : GridView.count(crossAxisCount: 3,
        children: chararters.map((e) => DisneyCard(character: e),).toList());
  }
  @override
  bool get wantKeepAlive => true;
}
