import 'package:flutter/material.dart';
import '../coordinates/rutas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> ruta18 = {
  // ignore: prefer_const_constructors
  Polyline(
    polylineId: const PolylineId('LN18I'),
    color: Colors.indigo,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta18Ida,
  ),
  const Polyline(
    polylineId: PolylineId('LN18V'),
    color: Colors.indigo,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta18Vuelta,
  ),
};
