//import 'dart:ffi';

class Recorrido {
    var linea; 
    var code; 
    var tiempo; 
    var distancia; 
    var velocidad; 
    var color; 
    var grosor; 
    var descripcion;
    var uid;

  Recorrido(
    {
      this.linea,
      this.code,
      this.tiempo,
      this.distancia,
      this.velocidad,
      this.color,
      this.grosor,
      this.descripcion,
      this.uid
    }
  );

  factory Recorrido.fromJson(Map<String, dynamic> json) {
    return Recorrido(
      linea: json['linea'],
      code: json['code'],
      tiempo: json['tiempo'],
      distancia: json['distancia'],
      velocidad: json['velocidad'],
      color: json['color'],
      grosor: json['grosor'],
      descripcion: json['descripcion'],
      uid: json['uid'],
    );
  }
}