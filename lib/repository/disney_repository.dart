import 'package:dio/dio.dart';
import 'package:mmtech_test/models/disney_character.dart';

class DisneyRepository{
  static Future<List<DisneyCharacter>> getDisneyCharecters()async{
    try{
      final response= await Dio().get('https://api.disneyapi.dev/character');
      final list= (response.data['data'] as List<dynamic>);
      return list.map((e) => DisneyCharacter.fromJson(e)).toList();
    }catch(e){
      return [];
    }
  }
}