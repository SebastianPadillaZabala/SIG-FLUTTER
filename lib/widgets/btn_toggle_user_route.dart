import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sig_app/blocs/blocs.dart';

class BtnToggleUserRoute extends StatelessWidget {
  const BtnToggleUserRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 6, 75, 95),
          maxRadius: 25,
          child: IconButton(
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              mapBloc.add(OnToggleUserRoute());
            },
          )),
    );
  }
}
