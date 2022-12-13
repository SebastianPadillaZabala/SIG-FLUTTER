import 'package:flutter/material.dart';
import '../coordinates/rutas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> ruta2 = {
  // ignore: prefer_const_constructors
  Polyline(
    polylineId: const PolylineId('LN2I'),
    color: Colors.green,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta2Ida,
  ),
  const Polyline(
    polylineId: PolylineId('LN2V'),
    color: Colors.green,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta2Vuelta,
  ),
};
