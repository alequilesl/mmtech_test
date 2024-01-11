import 'package:dio/dio.dart';
import 'package:mmtech_test/models/chess_player.dart';

class ChessRepository{
  static Future<List<String>> getAllGMPlayer()async{
    try{
      final response= await Dio().get('https://api.chess.com/pub/titled/GM');
      return List.from(response.data['players']);
    }catch(e){
      return [];
    }
  }

  static Future<ChessPlayerProfile?> getPlayerProfile(String player)async{
    try{
      final response= await Dio().get('https://api.chess.com/pub/player/$player');
      return ChessPlayerProfile.fromJson(response.data);
    }catch(e){
      return null;
    }
  }

  static Future<ChessPlayerStats?> getPlayerStats(String player)async{
    try{
      final response= await Dio().get('https://api.chess.com/pub/player/$player/stats');
      return ChessPlayerStats.fromJson(response.data);
    }catch(e){
      return null;
    }
  }
}