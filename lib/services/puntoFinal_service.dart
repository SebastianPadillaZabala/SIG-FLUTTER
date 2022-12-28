import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sig_app/models/api_reponse.dart';
import 'package:sig_app/models/puntoFinal.dart';
import 'package:sig_app/utils/const_service.dart';


Future<ApiResponse> getPuntosFinalCode(String code) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    http.Response response = await http.get(Uri.parse(puntosFinalCodeURL + '/$code'));
    switch (response.statusCode) {
      case 200: //print(response.body);
        apiResponse.data = jsonDecode(response.body).map((p) => 
                           PuntoFinal.fromJson(p)).toList();
        
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


// Future<ApiResponse> getUnalinea(String linea) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     http.Response response = await http.get(
//       Uri.parse(unaLineaURL + '/$linea'), 
//     );
//     switch (response.statusCode) {
//       case 200: apiResponse.data = Linea.fromJson(jsonDecode(response.body));
//         break;
//       case 404:
//         apiResponse.error = unautorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   } catch (e) {
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }
