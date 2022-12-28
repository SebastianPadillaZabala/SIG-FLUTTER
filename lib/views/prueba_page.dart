import 'package:flutter/material.dart';
import 'package:sig_app/models/api_reponse.dart';
import 'package:sig_app/services/recorrido_service.dart';
import 'package:sig_app/utils/const_service.dart';

class PruebaPage extends StatefulWidget {
  PruebaPage({Key? key}) : super(key: key);

  @override
  State<PruebaPage> createState() => _PruebaPageState();
}

class _PruebaPageState extends State<PruebaPage> {
  List<dynamic> recorridos_list = [];
  bool loading = true;
  int longRec = 0; 

  Future<void> _getRecorridos() async {
    print(allRecorridosURL);
    ApiResponse response = await getRecorridos();
    if(response.error == null){
      setState((){
        recorridos_list = response.data as List<dynamic>;
        if (recorridos_list.length == 0) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: no se encuentran preguntas")));
        }else{
          longRec = recorridos_list.length;
          print(longRec);
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
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: loading
      ? const Center(child:  CircularProgressIndicator()) 
      : ListView.builder(
        itemCount: longRec,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
            //    leading: const Icon(Icons.list),
                // trailing: Text(
                //   "${recorridos_list[index]}",
                //   style: TextStyle(color: Colors.green, fontSize: 15),
                // ),
                title: Text("${recorridos_list[index]}"));
          }),
    );
  }
}