import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sig_app/polylines/polylines.dart';

class BusRoutes {
  static final Map<String, Set<Polyline>> routes = {
    '1': ruta1,
    '2': ruta2,
    '5': ruta5,
    '8': ruta8,
    '9': ruta9,
    '10': ruta10,
    '11': ruta11,
    '16': ruta16,
    '17': ruta17,
    '18': ruta18,
  };

  static Map<String, Set<Polyline>> searchWhereLike(String query) {
    Map<String, Set<Polyline>> result = {};
    if (routes.containsKey(query)) {
      result.addAll({query: routes[query]!});
      return result;
    }
    routes.forEach((key, value) {
      if (key.contains(query) || query.contains(key)) {
        result.addAll({key: value});
      }
    });
    return result;
  }
}
