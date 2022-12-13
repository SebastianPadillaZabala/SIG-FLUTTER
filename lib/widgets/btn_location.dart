import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sig_app/blocs/blocs.dart';
import 'package:sig_app/ui/ui.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 6, 75, 95),
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(
            Icons.my_location_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            final userLocation = locationBloc.state.lastKnownLocation;
            if (userLocation == null) {
              final snack = CustomSnackBar(
                message: 'No hay ubicacion',
              );
              ScaffoldMessenger.of(context).showSnackBar(snack);
              return;
            }
            mapBloc.moveCamera(userLocation);
          },
        ),
      ),
    );
  }
}
