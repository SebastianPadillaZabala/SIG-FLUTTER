import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sig_app/models/api_reponse.dart';
import 'package:sig_app/models/linea.dart';
import 'package:sig_app/utils/const_service.dart';


Future<ApiResponse> getLineas() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    http.Response response = await http.get(Uri.parse(allLineasURL));
    
    switch (response.statusCode) {
      case 200:
          apiResponse.data = jsonDecode(response.body).map((p) => 
                             Linea.fromJson(p)).toList();
                             apiResponse.data as List<dynamic>;
        break;
      case 404:
        apiResponse.error = unautorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}


Future<ApiResponse> getUnalinea(String linea) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    http.Response response = await http.get(
      Uri.parse(unaLineaURL + '/$linea'), 
    );
    switch (response.statusCode) {
      case 200: apiResponse.data = Linea.fromJson(jsonDecode(response.body));
        break;
      case 404:
        apiResponse.error = unautorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}


// Future<List<Recorrido>> getRecorridos2() async {
//   http.Response response = await http.get(Uri.parse(allRecorridosURL));
//   final lista = List.from(jsonDecode(response.body));
//   List<Recorrido> recorridos = []; 
//   lista.forEach((element) {
//     final Recorrido rec = Recorrido.fromJson(element);
//     recorridos.add(rec);
//   });
//   return recorridos;
// }