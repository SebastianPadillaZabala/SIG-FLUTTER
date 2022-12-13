import 'package:flutter/material.dart';
import '../coordinates/rutas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> ruta8 = {
  // ignore: prefer_const_constructors
  Polyline(
    polylineId: const PolylineId('LN8I'),
    color: Colors.yellow,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta8Ida,
  ),
  const Polyline(
    polylineId: PolylineId('LN8V'),
    color: Colors.yellow,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta8Vuelta,
  ),
};
