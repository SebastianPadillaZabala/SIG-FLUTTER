
import 'package:flutter/material.dart';
import 'package:sig_app/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sig_app/models/models.dart';

class SearchDestinationDelegate extends SearchDelegate<SearchResult> {
  SearchDestinationDelegate() : super(searchFieldLabel: 'Buscar...');

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
          final result = SearchResult(cancel: true);
          close(context, result);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return ListView(
      children: [
        ListTile(
            leading:
                const Icon(Icons.location_on_outlined, color: Colors.black),
            title: const Text('Colocar la ubicacion manualmente',
                style: TextStyle(color: Colors.black)),
            onTap: () {
              final result = SearchResult(cancel: false);
              close(context, result);
            }),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/drxr7czpf/image/upload/w_256/p4342jsygtdplzgtkbbd'),
          ),
          titleText: 'Linea 1 ida',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('1', 'ida');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/drxr7czpf/image/upload/w_256/p4342jsygtdplzgtkbbd'),
          ),
          titleText: 'Linea 1 vuelta',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('1', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/glph3kke57gssd1ebddd'),
          ),
          titleText: 'Linea 2 ida',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            // TODO: regresar algo...
            mapBloc.drawRoutePolyline('2', 'ida');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/glph3kke57gssd1ebddd'),
          ),
          titleText: 'Linea 2 vuelta',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('2', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/mab9d3e0fbiybelaxg3n'),
          ),
          titleText: 'Linea 5 ida',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            // TODO: regresar algo...
            mapBloc.drawRoutePolyline('5', 'ida');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/mab9d3e0fbiybelaxg3n'),
          ),
          titleText: 'Linea 5 vuelta',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('5', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/jincwsv9eglld3qpwsqj'),
          ),
          titleText: 'Linea 8 ida',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            // TODO: regresar algo...
            mapBloc.drawRoutePolyline('8', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/jincwsv9eglld3qpwsqj'),
          ),
          titleText: 'Linea 8 vuelta',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('8', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          // ignore: prefer_const_constructors
          avatar: GFAvatar(
            backgroundImage: const NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/dkc7kb4fdcj2ffrjnaj9'),
          ),
          titleText: 'Linea 9 ida',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            // TODO: regresar algo...
            mapBloc.drawRoutePolyline('9', 'ida');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/dkc7kb4fdcj2ffrjnaj9'),
          ),
          titleText: 'Linea 9 vuelta',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('9', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/bjd1krmdmpzkqlhfth0s'),
          ),
          titleText: 'Linea 10 ida',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            // TODO: regresar algo...
            mapBloc.drawRoutePolyline('10', 'ida');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/bjd1krmdmpzkqlhfth0s'),
          ),
          titleText: 'Linea 10 vuelta',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('10', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/gcsntabsgc7ctxtihs7i'),
          ),
          titleText: 'Linea 11 ida',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            // TODO: regresar algo...
            mapBloc.drawRoutePolyline('11', 'ida');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/gcsntabsgc7ctxtihs7i'),
          ),
          titleText: 'Linea 11 vuelta',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('11', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/umpe2chjptjzli4xtblt'),
          ),
          titleText: 'Linea 16 ida',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            // TODO: regresar algo...
            mapBloc.drawRoutePolyline('16', 'ida');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/umpe2chjptjzli4xtblt'),
          ),
          titleText: 'Linea 16 vuelta',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('16', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/htaimhg7vgr4veciwibo'),
          ),
          titleText: 'Linea 17 ida',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            // TODO: regresar algo...
            mapBloc.drawRoutePolyline('17', 'ida');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/htaimhg7vgr4veciwibo'),
          ),
          titleText: 'Linea 17 vuelta',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('17', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/htaimhg7vgr4veciwibo'),
          ),
          titleText: 'Linea 18 ida',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            // TODO: regresar algo...
            mapBloc.drawRoutePolyline('18', 'ida');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
        GFListTile(
          avatar: const GFAvatar(
            backgroundImage: NetworkImage(
                'http://res.cloudinary.com/dyiopsjbb/image/upload/w_256/htaimhg7vgr4veciwibo'),
          ),
          titleText: 'Linea 18 vuelta',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          onTap: () {
            mapBloc.drawRoutePolyline('18', 'vuelta');
            final result = SearchResult(cancel: true);
            close(context, result);
          },
        ),
      ],
    );
  }
}
