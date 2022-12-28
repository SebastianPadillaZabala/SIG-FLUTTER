import 'package:flutter/material.dart';
import 'package:sig_app/models/api_reponse.dart';
import 'package:sig_app/models/linea.dart';
import 'package:sig_app/models/recorrido.dart';
import 'package:sig_app/services/linea_services.dart';
import 'package:sig_app/services/puntoFinal_service.dart';
import 'package:sig_app/services/recorrido_service.dart';


class PruebaPage extends StatefulWidget {
  PruebaPage({Key? key}) : super(key: key);

  @override
  State<PruebaPage> createState() => _PruebaPageState();
}

class _PruebaPageState extends State<PruebaPage> {
  bool loading = true;
  List<dynamic> recorridos_list = []; //recorridos
  Recorrido? unRecorrido; //recorridos

  List<dynamic> lineas_list = []; //recorridos
  Linea? unaLinea; //recorridos

  List<dynamic> puntosFinal_list = []; //puntos

  Future<void> _getRecorridos() async {//recorridos
    ApiResponse response = await getRecorridos();
    if(response.error == null){
      setState((){
        recorridos_list = response.data as List<dynamic>;
        if (recorridos_list.length == 0) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: no se encuentran preguntas")));
        }else{
          loading = false;
        }
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  Future<void> _getUnRecorrido(String code) async {//recorridos
    ApiResponse response = await getUnRecorrido(code);
    if(response.error == null){
      setState((){
        unRecorrido = response.data as Recorrido;
        loading = false;
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }



  Future<void> _getLineas() async {//lineas
    ApiResponse response = await getLineas();
    if(response.error == null){
      setState((){
        lineas_list = response.data as List<dynamic>;
        if (lineas_list.length == 0) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: no se encuentran preguntas")));
        }else{
          loading = false;
        }
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  Future<void> _getUnaLinea(String linea) async {//lineas
    ApiResponse response = await getUnalinea(linea);
    if(response.error == null){
      setState((){
        unaLinea = response.data as Linea;
        loading = false;
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }


  Future<void> _getPuntosFinalCode(String code) async { // puntos final los busca por codigo
    ApiResponse response = await getPuntosFinalCode(code);
    if(response.error == null){
      setState((){
        puntosFinal_list = response.data as List<dynamic>;
        print(puntosFinal_list.length);
        if (puntosFinal_list.length == 0) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: no se encuentran preguntas")));
        }else{
          loading = false;
          
        }
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    _getRecorridos();
    _getUnRecorrido('L001I');
    _getLineas();
    _getUnaLinea('L001');
    _getPuntosFinalCode('L001I');
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: loading
      ? const Center(child:  CircularProgressIndicator()) 
      : ListView.builder(
        itemCount: puntosFinal_list.length, //lineas_list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Row(
                children: <Widget>[
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage("${unaLinea?.foto}"),
                  // ),
                  Text("${puntosFinal_list[index].FID}"),
                  Text(" // ${puntosFinal_list[index].FID_stops2}"),
                  Text(" // ${puntosFinal_list[index].Punto}"),
                  Text(" // ${puntosFinal_list[index].code}"),
                  Text(" // ${puntosFinal_list[index].orden}"),
                  Text(" // ${puntosFinal_list[index].PuntoD}"),
                  Text(" // ${puntosFinal_list[index].LongD}"),
                  Text(" // ${puntosFinal_list[index].LartiD}"),
                  Text(" // ${puntosFinal_list[index].Lont}"),
                  Text(" // ${puntosFinal_list[index].Lati}"),
                  Text(" // ${puntosFinal_list[index].distancia}"),
                  Text(" // ${puntosFinal_list[index].dist_km}"),
                  Text(" // ${puntosFinal_list[index].Tpeso}"),
                  Text(" // ${puntosFinal_list[index].uid}"),
                ],
              ),
            );
          }),
    );
  }
}