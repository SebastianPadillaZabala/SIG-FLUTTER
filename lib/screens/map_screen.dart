import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sig_app/blocs/blocs.dart';
import 'package:sig_app/views/views.dart';
import 'package:sig_app/widgets/btn_toggle_user_route.dart';
import 'package:sig_app/widgets/widgets.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    // HomePage(),
    // OrderPage(),
    // // MyListPage(),
    // ProfilePage(),
  ];

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: const Color.fromARGB(255, 25, 151, 210),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Color.fromARGB(255, 255, 164, 73)!,
              hoverColor: Color.fromARGB(255, 255, 164, 73)!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Color.fromARGB(255, 255, 89, 39),
              color: Colors.white,
              tabs: const [
                GButton(
                  iconColor: Colors.white,
                  icon: Icons.home_rounded,
                  text: 'Inicio',
                ),
                GButton(
                  iconColor: Colors.white,
                  icon: Icons.location_on_outlined,
                  text: 'Mapa',
                ),
                // GButton(
                //   iconColor: Colors.white,
                //   icon: Icons.bookmark_border_rounded,
                //   text: 'My List',
                // ),
                GButton(
                  iconColor: Colors.white,
                  icon: Icons.person_outline_rounded,
                  text: 'Perfil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: const Color.fromARGB(255, 25, 151, 210),
      ),
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

            return SingleChildScrollView(
              child: Stack(
                children: [
                  MapView(
                    initialLocation: locationState.lastKnownLocation!,
                    polylines: polylines.values.toSet(),
                  ),
                  const SearchBar(),
                ],
              ),
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
