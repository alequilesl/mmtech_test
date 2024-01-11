class DisneyCharacter{
  int id;
  String name;
  String? imageUrl;

  DisneyCharacter({required this.id, required this.name, required this.imageUrl});
  DisneyCharacter.fromJson(Map<String, dynamic> json):
    id= json['_id'],
    name= json['name'],
    imageUrl= json['imageUrl'];
}