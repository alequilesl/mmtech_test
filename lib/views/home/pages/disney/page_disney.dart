
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

  Future<void> loadData()async{
    chararters= await DisneyRepository.getDisneyCharecters();
    setState(() {
      loading= false;
    });
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, ()=>loadData());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return
      loading
      ? const Center(child: CircularProgressIndicator(),)
      : RefreshIndicator(
        onRefresh: loadData,
        child: GridView.count(crossAxisCount: 3,
          children: chararters.map((e) => DisneyCard(character: e),).toList()),
      );
  }
  @override
  bool get wantKeepAlive => true;
}
