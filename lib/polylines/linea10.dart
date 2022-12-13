import 'package:flutter/material.dart';
import '../coordinates/rutas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> ruta10 = {
  // ignore: prefer_const_constructors
  Polyline(
    polylineId: const PolylineId('LN10I'),
    color: Colors.orange,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta10Ida,
  ),
  const Polyline(
    polylineId: PolylineId('LN10V'),
    color: Colors.orange,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta10Vuelta,
  ),
};
