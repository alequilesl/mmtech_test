class ChessStats{
  DateTime date;
  int rating;

  ChessStats({required this.rating, required this.date});
  ChessStats.fromJson(Map<String, dynamic> json):
    date= DateTime.fromMillisecondsSinceEpoch(json['date']),
    rating= json["rating"];
}

class ChessRecord{
  int win, loss, draw;

  ChessRecord({required this.win, required this.loss, required this.draw});
  ChessRecord.fromJson(Map<String, dynamic> json):
        win= json['win'],
        loss= json['loss'],
        draw= json['draw'];
}

class ChessModeStats{
  ChessStats last, best;
  ChessRecord record;

  ChessModeStats({required this.best, required this.last, required this.record});
  ChessModeStats.fromJson(Map<String, dynamic> json):
    last= ChessStats.fromJson(json['last']),
    best= ChessStats.fromJson(json['best']),
    record= ChessRecord.fromJson(json['record']);
}

class ChessPlayerStats{
  ChessModeStats rapid, blitz, bullet;

  ChessPlayerStats({required this.rapid, required this.blitz, required this.bullet});
  ChessPlayerStats.fromJson(Map<String, dynamic> json):
    rapid= ChessModeStats.fromJson(json['chess_rapid']),
    blitz= ChessModeStats.fromJson(json['chess_blitz']),
    bullet= ChessModeStats.fromJson(json['chess_bullet']);
}

class ChessPlayerProfile{
  int playerId;
  String? avatar;
  String name, username;

  ChessPlayerProfile({required this.name, required this.username, required this.avatar, required this.playerId});
  ChessPlayerProfile.fromJson(Map<String, dynamic> json):
        playerId= json['player_id'] ?? 0,
        avatar= json['avatar'],
        name= json['name'] ?? (json['username'] ?? ''),
        username= json['username'] ?? '';
}
