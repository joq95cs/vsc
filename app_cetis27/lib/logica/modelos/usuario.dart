class Usuario {
  bool existe; //Para saber si se encontró el usuario al iniciar sesión
  int? id;
  String? nombre;
  String? apellidoPaterno;
  String? apellidoMaterno;
  int? nivel;
  String? curp;
  int? tipo;
  Usuario(
    this.existe, {
    this.id,
    this.nombre,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.nivel,
    this.curp,
    this.tipo,
  });
}
