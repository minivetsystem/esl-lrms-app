import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/history_page/models/history_model.dart';
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
}
