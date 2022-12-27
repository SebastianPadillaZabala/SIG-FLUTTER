import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/map_screen.dart';
import '../views/rutas_lineas/rutas_view.dart';


class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);


  @override
  State<NavigationBarWidget> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    MapScreen(),
    RutasView(),
    // MyListPage(),
    MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
       borderRadius: const BorderRadius.all(Radius.circular(20),),
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


              // GButton(
              //   iconColor: Colors.white,
              //   icon: Icons.bookmark_border_rounded,
              //   text: 'My List',
              // ),
              GButton(
                iconColor: Colors.white,
                icon: Icons.bus_alert_outlined,
                text: 'Rutas',
              ),
              GButton(
                iconColor: Colors.white,
                icon: Icons.location_on_outlined,
                text: 'Mapa',
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
    );

  }


}
