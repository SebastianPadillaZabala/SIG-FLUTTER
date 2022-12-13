import 'package:flutter/material.dart';
import '../coordinates/rutas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> ruta5 = {
  // ignore: prefer_const_constructors
  Polyline(
    polylineId: const PolylineId('LN5I'),
    color: Colors.blue,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta5Ida,
  ),
  const Polyline(
    polylineId: PolylineId('LN5V'),
    color: Colors.blue,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta5Vuelta,
  ),
};
