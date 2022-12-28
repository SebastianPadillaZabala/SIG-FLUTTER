import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sig_app/models/api_reponse.dart';
import 'package:sig_app/models/recorrido.dart';
import 'package:sig_app/utils/const_service.dart';


Future<ApiResponse> getRecorridos() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
      Uri.parse(allRecorridosURL), 
      headers: {
        'Accept': 'application/json',
      }
    );
    switch (response.statusCode) {
      case 200: apiResponse.data = jsonDecode(response.body).map((p) => Recorrido.fromJson(p)).toList();
                apiResponse.data as List<dynamic>;
      //  apiResponse.data = Examen.fromJson(jsonDecode(response.body));
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
    final response = await http.get(
      Uri.parse(unRecorridoURL + '/$code'), 
      headers: {
        'Accept': 'application/json',
      }
    );
    switch (response.statusCode) {
      case 200: apiResponse.data = Recorrido.fromJson(jsonDecode(response.body));
      //  apiResponse.data = Examen.fromJson(jsonDecode(response.body));
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