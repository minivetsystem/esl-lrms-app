import 'dart:io';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:intl/intl.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/controller/home_four_controller.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/models/home_four_model.dart';
import 'package:vedanta_lrms/presentation/search_one_screen/controller/search_one_controller.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_circleimage.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_utils/qr_code_utils.dart';
// import 'package:vedanta_lrms/widgets/custom_button.dart';
// import 'package:vedanta_lrms/widgets/custom_icon_button.dart';
// import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  HomeFourController controller1 =
      Get.put(HomeFourController(HomeFourModel().obs));
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  Uint8List? _imageBytes;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void onQRViewCamera(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  Future<void> _pickImage() async {
   
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    var stringResult;
    if (pickedFile != null) {
      final Uint8List bytes = await pickedFile.readAsBytes();
      final String? result = await QrCodeUtils.decodeFrom(bytes as String);

      setState(() {
        _imageBytes = bytes;
        stringResult =result;
      });
      if (result != null) {
        // Handle the scanned QR code (e.g., display it in a dialog)
          AlertDialog(
         
         
         title:  Text('AlertDialog Title'),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text(result),
            ],
          )
        )
   );
      } else {
        // No QR code found in the image
   AlertDialog(
         
         
         title:  Text('AlertDialog Title else'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text(stringResult),
            ],
          )
        )
   );
      }
    }else{
  //  Text(pickedFile as String);
   AlertDialog(
         
         
         title:  Text('AlertDialog Title picked'),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text(stringResult),
            ],
          )
        )
   );
            // AlertDialog(
            //   title: Text("Scanned QR Code"),
            //   content: Text(result),
            //   actions: <Widget>[
            //     ElevatedButton(
            //       child: Text("OK"),
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //     ),
            //   ],
            // );
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchOneController>(
      init: SearchOneController(),
      builder: (searchOneController) => ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: WillPopScope(
          onWillPop: () async {
            Future.delayed(const Duration(milliseconds: 1000), () {
              SystemNavigator.pop();
            });
            return false;
          },
          child: Center(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ColorConstant.lightGray,
              appBar: CustomAppBar(
                height: getVerticalSize(
                  70.00,
                ),
                title: Padding(
                  padding: getPadding(
                    left: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppbarSubtitle(
                        text: "lbl_welcome2".tr,
                      ),
                      AppbarSubtitle1(
                        text: "lbl_jerome_bell".tr,
                        margin: getMargin(
                          top: 1,
                          right: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  AppbarCircleimage(
                    imagePath: ImageConstant.imgEllipse3,
                    margin: getMargin(
                      left: 20,
                      top: 11,
                      right: 20,
                      bottom: 19,
                    ),
                  ),
                ],
                styleType: Style.bgFillblueA200,
              ),
              body: Stack(
                children: [
                  // buildQrView(context),
                  // buildCustomOverlay(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: (QRViewController controller) {
        setState(() {
          this.controller = controller;
        });
        controller.scannedDataStream.listen((scanData) {
          // Handle the scanned data
         Navigator.pushNamed(context, AppRoutes.historyPage);
        });
      },
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: 300,
      ),
    );
  }

  Widget buildCustomOverlay() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          Positioned(
            left: 70,
            bottom: 100,
            child: Container(
              child: ElevatedButton(
                onPressed: () => _pickImage(),
                child: Text('Pick QR Code Image from Gallery'),
              ),
            ),
          ),
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Container(
          //     width: 20,
          //     height: 20,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.red, width: 2),
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: Container(
          //     width: 20,
          //     height: 20,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.red, width: 2),
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: Container(
          //     width: 20,
          //     height: 20,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.red, width: 2),
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Container(
          //     width: 20,
          //     height: 20,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.red, width: 2),
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
