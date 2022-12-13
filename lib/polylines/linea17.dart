import 'package:flutter/material.dart';
import '../coordinates/rutas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> ruta17 = {
  // ignore: prefer_const_constructors
  Polyline(
    polylineId: const PolylineId('LN17I'),
    color: Colors.purple,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta17Ida,
  ),
  const Polyline(
    polylineId: PolylineId('LN17V'),
    color: Colors.purple,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta17Vuelta,
  ),
};
