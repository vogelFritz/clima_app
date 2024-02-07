class Clima {
  final String ciudad;
  final int temp;
  final int sensacionTermica;
  final int humedad;
  final int presion;
  final int visibilidad;
  final String descripcion;
  final Viento viento;
  final String iconId;
  Clima({
    required this.ciudad,
    required this.temp,
    required this.sensacionTermica,
    required this.humedad,
    required this.presion,
    required this.visibilidad,
    required this.descripcion,
    required this.viento,
    required this.iconId,
  });
}

class Viento {
  final double velocidad;
  final String direccion;
  Viento({
    required this.velocidad,
    required this.direccion,
  });
}
