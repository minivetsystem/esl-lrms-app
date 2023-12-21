import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/survey_list_page/models/survey_list_model.dart';
import 'package:vedanta_lrms/presentation/map_page/models/load_map_data_model.dart';
import 'package:vedanta_lrms/presentation/map_page/models/polt_details_by_searchid_model.dart';
import 'package:vedanta_lrms/presentation/search_one_screen/models/search_one_model.dart';

class ApiClient extends GetConnect {
  static final String get_survey = "${Constant.baseurl}notification/get-survey";
  Future<NotificationResponse> getSurveyList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.get(Uri.parse(get_survey), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return NotificationResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  static final String layer_list = "${Constant.baseurl}layer-list";
  Future<LayerList> getLayerList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(Uri.parse(layer_list), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return LayerList.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<PlotDetailsfromSearch> searchByAddress(plotId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
        Uri.parse('${Constant.baseurl}search-address?plot_id=$plotId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return PlotDetailsfromSearch.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<LoadMapData> getLoadListData(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http
        .get(Uri.parse('${Constant.baseurl}load-map-data/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return LoadMapData.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<void> loginAuth(email, password, deviceId) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('key', 'value');
    var url = Uri.parse('${Constant.baseurl}login');
    // var request = http.MultipartRequest('POST', url);
    var map = new Map<String, dynamic>();
    // Add form fields (non-file data)
    map['email'] = email;
    map['password'] = password;
    map['device_id'] = deviceId;
    // final response = await http.MultipartRequest('POST',Uri.parse('${Constant.baseurl}login'));
    final response = await http.post(
      url,
      body: map,
    );
    // var response = await request.send();
    // final respStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return jsonDecode(response.body.toString());
      // return LoginModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load notifications');
    }
  }
//   Future<void> loginAuth( email , password,deviceId) async {

//   try{

//     Response response = await post(
//       Uri.parse('https://reqres.in/api/login'),
//       body: {
//         'email' : email,
//         'password' : password
//       }
//     );

//     if(response.statusCode == 200){

//       var data = jsonDecode(response.body.toString());
//       print(data['token']);
//       print('Login successfully');

//     }else {
//       print('failed');
//     }
//   }catch(e){
//     print(e.toString());
//   }
// }
}
