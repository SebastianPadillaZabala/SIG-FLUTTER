import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sig_app/blocs/blocs.dart';
import 'package:sig_app/views/views.dart';
import 'package:sig_app/widgets/btn_toggle_user_route.dart';
import 'package:sig_app/widgets/widgets.dart';

import '../widgets/navigation_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }
  //Color.fromARGB(255, 255, 89, 39),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Inicio"),
      //   backgroundColor: const Color.fromARGB(255, 25, 151, 210),
      // ),
      body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, locationState) {
        if (locationState.lastKnownLocation == null) {
          return const Center(
            child: Text('Espere por favor.....'),
          );
        }
        return BlocBuilder<MapBloc, MapState>(
          builder: (context, mapState) {
            Map<String, Polyline> polylines = Map.from(mapState.polylines);
            if (!mapState.showMyRoutes) {
              polylines.removeWhere((key, value) => key == 'myRoute');
            }

            return Stack(
              children: [
                MapView(
                  initialLocation: locationState.lastKnownLocation!,
                  polylines: polylines.values.toSet(),
                ),
                const SearchBar(),
              ],
            );
          },
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          BtnToggleUserRoute(),
          BtnFollowUser(),
          BtnCurrentLocation()
        ],
      ),
    );
  }
}
