import 'package:flutter/material.dart';
import '../coordinates/rutas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> ruta11 = {
  // ignore: prefer_const_constructors
  Polyline(
    polylineId: const PolylineId('LN11I'),
    color: Colors.brown,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta11Ida,
  ),
  const Polyline(
    polylineId: PolylineId('LN11V'),
    color: Colors.brown,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta11Vuelta,
  ),
};
