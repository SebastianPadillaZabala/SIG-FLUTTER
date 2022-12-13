import 'package:flutter/material.dart';
import '../coordinates/rutas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> ruta1 = {
  // ignore: prefer_const_constructors
  Polyline(
    polylineId: const PolylineId('LN1I'),
    color: Colors.red,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta1Ida,
  ),
  const Polyline(
    polylineId: PolylineId('LN1V'),
    color: Colors.red,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta1Vuelta,
  ),
};
