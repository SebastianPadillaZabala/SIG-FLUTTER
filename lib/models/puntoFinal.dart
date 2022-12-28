import 'dart:ffi';

class PuntoFinal {
  

  int? FID;
  int? FID_stops2 ;
  int? Punto;
  String? code;
  int? orden;
  int? PuntoD;
  num? LongD;
  num? LartiD;
  num? Lont;
  num? Lati;
  num? distancia;
  num? dist_km;
  int? Tpeso;
  String? uid;


  PuntoFinal({
    this.FID,
    this.FID_stops2,
    this.Punto,
    this.code,
    this.orden,
    this.PuntoD,
    this.LongD,
    this.LartiD,
    this.Lont,
    this.Lati,
    this.distancia,
    this.dist_km,
    this.Tpeso,
    this.uid
  });

  factory PuntoFinal.fromJson(Map<String, dynamic> json) {
    return PuntoFinal(
      FID: json['FID'],
      FID_stops2 : json['FID_stops2'],
      Punto : json['Punto'],
      code : json['code'],
      orden : json['orden'],
      PuntoD : json['PuntoD'],
      LongD : json['LongD'],
      LartiD : json['LartiD'],
      Lont : json['Lont'],
      Lati : json['Lati'],
      distancia : json['distancia'],
      dist_km : json['dist_km'],
      Tpeso : json['Tpeso'],
      uid: json['uid'],
    );
  }
}