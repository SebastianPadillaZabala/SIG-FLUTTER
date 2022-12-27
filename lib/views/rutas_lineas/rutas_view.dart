import 'package:flutter/material.dart';


class RutasView extends StatefulWidget {
  const RutasView({Key? key}) : super(key: key);

  @override
  State<RutasView> createState() => _RutasViewState();
}

class _RutasViewState extends State<RutasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Rutas"),
        ),
      ),
    );
  }
}
