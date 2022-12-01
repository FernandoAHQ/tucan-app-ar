class Location {
  late String sId;
  late String name;
  late bool isBuilding;
  late String description;
  //late String images;
  late List<dynamic> images;
  late String map;
  late String especialidad;
  late String body;
  late String horario;

  Location({
    required this.sId,
    required this.name,
    required this.images,
    required this.description,
    required this.map,
    required this.body,
    required this.horario

  }); 

  Location.fromJson(Map<String, dynamic> json) {
    
    sId = json['_id'];
    description = json['description'];
    body = json['body'];
    images = json['images'];
    map = json['map'];
    horario = json['horario'];
  }

}

