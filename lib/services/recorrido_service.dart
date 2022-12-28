import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sig_app/models/api_reponse.dart';
import 'package:sig_app/models/recorrido.dart';
import 'package:sig_app/utils/const_service.dart';


Future<ApiResponse> getRecorridos() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    http.Response response = await http.get(Uri.parse(allRecorridosURL));
    
    switch (response.statusCode) {
      case 200:
          apiResponse.data = jsonDecode(response.body).map((p) => 
                             Recorrido.fromJson(p)).toList();
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


Future<ApiResponse> getUnRecorrido(String code) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    http.Response response = await http.get(
      Uri.parse(unRecorridoURL + '/$code'), 
    );
    switch (response.statusCode) {
      case 200: apiResponse.data = Recorrido.fromJson(jsonDecode(response.body));
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