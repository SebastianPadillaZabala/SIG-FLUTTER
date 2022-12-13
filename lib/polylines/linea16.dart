import 'package:flutter/material.dart';
import '../coordinates/rutas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> ruta16 = {
  // ignore: prefer_const_constructors
  Polyline(
    polylineId: const PolylineId('LN16I'),
    color: Colors.pink,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta16Ida,
  ),
  const Polyline(
    polylineId: PolylineId('LN16V'),
    color: Colors.pink,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta16Vuelta,
  ),
};
