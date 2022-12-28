import 'dart:math';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:sig_app/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

class SearchDestinationDelegateIda extends SearchDelegate {
  SearchDestinationDelegateIda() : super(searchFieldLabel: 'Buscar...');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              ButtonsTabBar(
                backgroundColor: const Color.fromARGB(255, 255, 89, 39),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.directions_bus_filled_outlined),
                    text: "Lineas de Ida",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_bus_rounded),
                    text: "Lineas de Vuelta",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    listviewLineasIda(mapBloc, context),
                    lineasListViewVuelta(mapBloc, context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView listviewLineasIda(
      MapBloc mapBloc, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ignore: prefer_const_constructors
          Column(
            children: [
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 1 ida',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('1', 'ida');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 2 ida',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  // TODO: regresar algo...
                  mapBloc.drawRoutePolyline('2', 'ida');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 5 ida',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  // TODO: regresar algo...
                  mapBloc.drawRoutePolyline('5', 'ida');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 8 ida',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  // TODO: regresar algo...
                  mapBloc.drawRoutePolyline('8', 'vuelta');
                  close(context, null);
                },
              ),
              GFListTile(
                // ignore: prefer_const_constructors
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 9 ida',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  // TODO: regresar algo...
                  mapBloc.drawRoutePolyline('9', 'ida');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 10 ida',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  // TODO: regresar algo...
                  mapBloc.drawRoutePolyline('10', 'ida');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 11 ida',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  // TODO: regresar algo...
                  mapBloc.drawRoutePolyline('11', 'ida');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 16 ida',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  // TODO: regresar algo...
                  mapBloc.drawRoutePolyline('16', 'ida');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 17 ida',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  // TODO: regresar algo...
                  mapBloc.drawRoutePolyline('17', 'ida');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 18 ida',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  // TODO: regresar algo...
                  mapBloc.drawRoutePolyline('18', 'ida');
                  close(context, null);
                },
              ),
            ],
          ),

          //TODO ACA EMPIEZAN LAS VUELTAS
        ],
      ),
    );
  }

  SingleChildScrollView lineasListViewVuelta(
      MapBloc mapBloc, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ignore: prefer_const_constructors
          Column(
            children: [
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 1 vuelta',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('1', 'vuelta');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 2 vuelta',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('2', 'vuelta');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 5 vuelta',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('5', 'vuelta');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 8 vuelta',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('8', 'vuelta');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 9 vuelta',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('9', 'vuelta');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 10 vuelta',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('10', 'vuelta');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 11 vuelta',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('11', 'vuelta');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 16 vuelta',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('16', 'vuelta');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 17 vuelta',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('17', 'vuelta');
                  close(context, null);
                },
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/furgoneta.png"),
                ),
                titleText: 'Linea 18 vuelta',
                subTitleText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing',
                onTap: () {
                  mapBloc.drawRoutePolyline('18', 'vuelta');
                  close(context, null);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
