part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool showMyRoutes;
  //Polylines

  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;
  /*
  mi_ruta: {
    id: polylineID Google,
    points: [ [lat,lng], [122333,1212123], [121212,232323]],
    width: 3,
    color: black
  }
  */

  const MapState({
    this.isMapInitialized = false,
    this.isFollowingUser = true,
    this.showMyRoutes = true,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
  })  : polylines = polylines ?? const {},
        markers = markers ?? const {};

  MapState copyWith(
          {bool? isMapInitialized,
          bool? isFollowingUser,
          bool? showMyRoutes,
          Map<String, Polyline>? polylines,
          Map<String, Marker>? markers}) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        polylines: polylines ?? this.polylines,
        markers: markers ?? this.markers,
        showMyRoutes: showMyRoutes ?? this.showMyRoutes,
      );

  @override
  List<Object> get props =>
      [isMapInitialized, isFollowingUser, polylines, showMyRoutes, markers];
}
