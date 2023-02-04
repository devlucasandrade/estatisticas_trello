class ListModel {
  String id;
  String name;
  String? idBoard;

  ListModel({
    required this.id,
    required this.name,
    this.idBoard,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        id: json['id'],
        name: json['name'],
        idBoard: json['idBoard'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "idBoard": idBoard,
      };
}
