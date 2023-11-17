import 'package:truck_booking_app/core/app_export.dart';

import 'package:flutter/material.dart';

import '../models/home_four_model.dart';

class HomeFourController extends GetxController {
  HomeFourController(this.homeFourModelObj);

  TextEditingController group268Controller = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  Rx<HomeFourModel> homeFourModelObj;
  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    group268Controller.dispose();
  }

  Future<void> selectTime(BuildContext context) async {
    // if (picked != null && picked != time) {
    //   setTime(picked);
    //   time = picked;
    //   update();
    // }
  }
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorConstant.blue, // <-- SEE HERE
              onPrimary: ColorConstant.black900, // <-- SEE HERE
              onSurface: ColorConstant.black900,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != date) {
      date = picked;
      // setDate(picked);
      update();
    }
  }

  void setDate(DateTime date) {
    selectedDate = date;
    update();
  }

  void setTime(DateTime time) {
    selectedTime = time;
    update();
  }
}
