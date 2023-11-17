import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truck_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class CustomPage extends StatelessWidget {
  Widget widget;

  CustomPage({required this.widget});

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return kIsWeb
        ? Center(
            child: Container(
              width: 428.h,
              child: widget,
            ),
          )
        : widget;
  }
}
