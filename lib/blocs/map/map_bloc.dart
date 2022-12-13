import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sig_app/blocs/blocs.dart';
import 'package:sig_app/coordinates/rutas.dart';
import 'package:sig_app/themes/themes.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;

  StreamSubscription<LocationState>? locationStateSubscription;

  MapBloc({required this.locationBloc}) : super(const MapState()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<OnStartFollowingUserEvent>(_onStartFollowingUser);
    on<OnStopFollowingUserEvent>(
        (event, emit) => emit(state.copyWith(isFollowingUser: false)));
    on<UpdateUserPolylineEvent>(_onPolylineNewPoint);
    on<OnToggleUserRoute>((event, emit) =>
        emit(state.copyWith(showMyRoutes: !state.showMyRoutes)));
    on<DisplayPolylinesEvente>(
        (event, emit) => emit(state.copyWith(polylines: event.polylines)));

    locationStateSubscription = locationBloc.stream.listen((locationState) {
      if (locationState.lastKnownLocation != null) {
        add(UpdateUserPolylineEvent((locationState.myLocationHistory)));
      }
      if (!state.isFollowingUser) return;
      if (locationState.lastKnownLocation == null) return;

      moveCamera(locationState.lastKnownLocation!);
    });
  }

  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(uberMapTheme));
    emit(state.copyWith(isMapInitialized: true));
  }

  void _onStartFollowingUser(
      OnStartFollowingUserEvent event, Emitter<MapState> emit) {
    emit(state.copyWith(isFollowingUser: true));
    if (locationBloc.state.lastKnownLocation == null) return;
    moveCamera(locationBloc.state.lastKnownLocation!);
  }

  void _onPolylineNewPoint(
      UpdateUserPolylineEvent event, Emitter<MapState> emit) {
    final myRoute = Polyline(
        polylineId: const PolylineId('myRoute'),
        color: Colors.black,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        points: event.userLocations);

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;
    emit(state.copyWith(polylines: currentPolylines));
  }

  void drawRoutePolyline(String query, String query2) {
    // ignore: prefer_const_constructors
    switch (query) {
      case '1':
        if (query2 == 'ida') {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.red,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta1Ida);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } else {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.red,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta1Vuelta);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } // The switch statement must be told to exit, or it will execute every case.
      case '2':
        if (query2 == 'ida') {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.black,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta2Ida);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } else {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.black,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta2Vuelta);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        }
      case '5':
        if (query2 == 'ida') {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.purple,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta5Ida);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } else {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.purple,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta5Vuelta);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        }
      case '8':
        if (query2 == 'ida') {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.blue,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta8Ida);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } else {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.blue,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta8Vuelta);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        }
      case '9':
        if (query2 == 'ida') {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.green,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta9Ida);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } else {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.green,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta9Vuelta);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        }
      case '10':
        if (query2 == 'ida') {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.lightBlue,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta10Ida);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } else {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.lightBlue,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta10Vuelta);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        }
      case '11':
        if (query2 == 'ida') {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.yellow,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta11Ida);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } else {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.yellow,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta11Vuelta);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        }
      case '16':
        if (query2 == 'ida') {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.orange,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta16Ida);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } else {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.orange,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta16Vuelta);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        }
      case '17':
        if (query2 == 'ida') {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.brown,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta17Ida);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } else {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.brown,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta17Vuelta);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        }
      case '18':
        if (query2 == 'ida') {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.pinkAccent,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta18Ida);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        } else {
          const myRoute2 = Polyline(
              polylineId: PolylineId('route'),
              color: Colors.brown,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: ruta18Vuelta);
          final currentPolylines = Map<String, Polyline>.from(state.polylines);
          currentPolylines['route'] = myRoute2;
          add(DisplayPolylinesEvente(currentPolylines));
          break;
        }
      default:
    }
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    return super.close();
  }
}
