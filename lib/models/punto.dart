class Punto {
    String? code; 
    String? latitud; 
    String? longitud;
    String? linea; 
    int? orden;  
    String? uid;

  Punto(
    {
      this.code,
      this.latitud,
      this.longitud,
      this.linea,
      this.orden,
      this.uid
    }
  );

  factory Punto.fromJson(Map<String, dynamic> json) {
    return Punto(
      code: json['code'],
      latitud: json['latitud'],
      longitud: json['longitud'],
      linea: json['linea'],
      orden: json['orden'],
      uid: json['uid'],
    );
  }
}