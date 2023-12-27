import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/survey_details_screen/models/visits_model.dart';
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
      throw Exception('${response.statusCode}');
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

  // Future<SurveyDetails> getSurveyDetails(id) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');
  //   final response = await http.get(
  //       Uri.parse('${Constant.baseurl}notification/get-survey-details/$id'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       });
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonResponse = json.decode(response.body);
  //     return SurveyDetails.fromJson(jsonResponse);
  //     // return json.decode(response.body);
  //     // label = data['mapFeatures'];
  //     // final details = data['results']['details']['notification'];
  //     // setState(() {
  //     //   SurveyDetails = data;

  //     //   geoJSONData = data['results']['geoJSONData'];
  //     //   geoJSONDataPlot = data['results']['geoJSONDataPlot'];
  //     //   lat = data['results']['details']['notification']['detail'][0]['lat'];
  //     //   visits = details['visits'];
  //     //   lng = data['results']['details']['notification']['detail'][0]['lng'];
  //     //   isMultiPlot = data['results']['details']['notification']['detail'][0]
  //     //       ['is_multi_plot'];
  //     //   if (isMultiPlot == 1) {
  //     //     detailArray =
  //     //         data['results']['details']['notification']['detail_array'];
  //     //     visitedArray =
  //     //         data['results']['details']['notification']['visited_array'];
  //     //   }
  //     //   if (details['detail'][0]['plot'] != null) {
  //     //     plotId = details['detail'][0]['plot']['khasara_no'];
  //     //   } else {
  //     //     plotId = "";
  //     //   }

  //     //   if (details['detail'][0]['plot'] != null) {
  //     //     this.plotmainId = details['detail'][0]['plot']['id'];
  //     //   }
  //     //   loadData = true;
  //     // });
  //   } else {
  //     throw Exception();
  //   }
  // }
}
