import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/ticket_preview_screen/models/ticket_preview_model.dart';class TicketPreviewController extends GetxController {Rx<TicketPreviewModel> ticketPreviewModelObj = TicketPreviewModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
