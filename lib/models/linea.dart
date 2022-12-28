class Linea {
    String? linea; 
    String? direccion; 
    String? telefono;
    String? mail; 
    String? foto;  
    String? descripcion;
    String? uid;

  Linea(
    {
      this.linea,
      this.direccion,
      this.telefono,
      this.mail,
      this.foto,
      this.descripcion,
      this.uid
    }
  );

  factory Linea.fromJson(Map<String, dynamic> json) {
    return Linea(
      linea: json['linea'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      mail: json['mail'],
      foto: json['foto'],
      descripcion: json['descripcion'],
      uid: json['uid'],
    );
  }
}