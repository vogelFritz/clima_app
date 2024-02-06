class Clima {
  final String ciudad;
  final int temp;
  final int sensacionTermica;
  final int humedad;
  final int visibilidad;
  final String descripcion;
  final Viento viento;
  Clima({
    required this.ciudad,
    required this.temp,
    required this.sensacionTermica,
    required this.humedad,
    required this.visibilidad,
    required this.descripcion,
    required this.viento,
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
