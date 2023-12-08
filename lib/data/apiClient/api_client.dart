import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/data/models/loginModel/login_model.dart';
import 'package:vedanta_lrms/presentation/history_page/models/history_model.dart';
import 'package:vedanta_lrms/presentation/map_page/models/load_map_data_model.dart';
import 'package:vedanta_lrms/presentation/search_one_screen/models/search_one_model.dart';

class ApiClient extends GetConnect {
  static final String get_survey = "${Constant.baseurl}notification/get-survey";
  Future<NotificationResponse> getSurveyList() async {
    final response = await http.get(Uri.parse(get_survey), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdmVkYW50YS5oaWdobGFuZGVuZXJneW5pZy5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE3MDE2NzAyNTQsImV4cCI6MTcwMjI3NTA1NCwibmJmIjoxNzAxNjcwMjU0LCJqdGkiOiIwbTFtQXZiazJxbVJoNHRFIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.ondDHcYePjuCqPRweeYKRRWCzx85c8biNEm5ZQjWsmw',
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
    final response = await http.get(Uri.parse(layer_list), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdmVkYW50YS5oaWdobGFuZGVuZXJneW5pZy5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE3MDE2NzAyNTQsImV4cCI6MTcwMjI3NTA1NCwibmJmIjoxNzAxNjcwMjU0LCJqdGkiOiIwbTFtQXZiazJxbVJoNHRFIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.ondDHcYePjuCqPRweeYKRRWCzx85c8biNEm5ZQjWsmw',
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return LayerList.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<LoadMapData> getLoadListData(id) async {
    final response = await http
        .get(Uri.parse('${Constant.baseurl}load-map-data/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdmVkYW50YS5oaWdobGFuZGVuZXJneW5pZy5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE3MDE2NzAyNTQsImV4cCI6MTcwMjI3NTA1NCwibmJmIjoxNzAxNjcwMjU0LCJqdGkiOiIwbTFtQXZiazJxbVJoNHRFIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.ondDHcYePjuCqPRweeYKRRWCzx85c8biNEm5ZQjWsmw',
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return LoadMapData.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<void> loginAuth( email, password, deviceId) async {
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
