import 'package:flutter/material.dart';
import '../coordinates/rutas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> ruta9 = {
  // ignore: prefer_const_constructors
  Polyline(
    polylineId: const PolylineId('LN9I'),
    color: Colors.black,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta9Ida,
  ),
  const Polyline(
    polylineId: PolylineId('LN9V'),
    color: Colors.black,
    width: 1,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
    points: ruta9Vuelta,
  ),
};
