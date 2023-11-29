import '../ticket_preview_screen/widgets/ticket_preview_item_widget.dart';import 'controller/ticket_preview_controller.dart';import 'models/ticket_preview_item_model.dart';import 'package:flutter/material.dart';import 'package:vedanta_lrms/core/app_export.dart';import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';import 'package:vedanta_lrms/widgets/app_bar/appbar_title.dart';import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';import 'package:vedanta_lrms/widgets/custom_button.dart';class TicketPreviewScreen extends GetWidget<TicketPreviewController> {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(56.00), leadingWidth: 52, leading: AppbarImage(height: getSize(32.00), width: getSize(32.00), svgPath: ImageConstant.imgArrowleft, margin: getMargin(left: 20, top: 12, bottom: 12), onTap: onTapArrowleft24), title: AppbarTitle(text: "lbl_ticket_preview".tr, margin: getMargin(left: 16))), body: Container(width: size.width, padding: getPadding(left: 20, top: 12, right: 20, bottom: 12), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Container(width: getHorizontalSize(388.00), padding: getPadding(all: 16), decoration: AppDecoration.fillGray100.copyWith(borderRadius: BorderRadiusStyle.roundedBorder4), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Padding(padding: getPadding(top: 1), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Text("lbl_passanger".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFUITextBold17.copyWith(height: getVerticalSize(1.08))), Padding(padding: getPadding(top: 4), child: Text("lbl_lorem_ipsum3".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFUITextRegular17Gray600.copyWith(height: getVerticalSize(1.08))))]), CustomButton(height: 40, width: 140, text: "lbl_add".tr, margin: getMargin(top: 1, bottom: 4), variant: ButtonVariant.OutlineblueA200_1, padding: ButtonPadding.PaddingAll9, fontStyle: ButtonFontStyle.SFUITextBold14)])), Padding(padding: getPadding(top: 23), child: Obx(() => ListView.separated(physics: BouncingScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(24.00));}, itemCount: controller.ticketPreviewModelObj.value.ticketPreviewItemList.length, itemBuilder: (context, index) {TicketPreviewItemModel model = controller.ticketPreviewModelObj.value.ticketPreviewItemList[index]; return TicketPreviewItemWidget(model);}))), Padding(padding: getPadding(top: 24), child: Text("lbl_seat_no_6a".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFUITextBold17.copyWith(height: getVerticalSize(1.08))))])), Padding(padding: getPadding(top: 16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("lbl_total_amount".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFUITextRegular17Gray600.copyWith(height: getVerticalSize(1.08))), Text("lbl_625_00".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFUITextBold17blueA200.copyWith(height: getVerticalSize(1.08)))])), Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(top: 32), child: Text("lbl_bar_code".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFUITextBold17.copyWith(height: getVerticalSize(1.08))))), CustomImageView(svgPath: ImageConstant.imgGroupBlack900, height: getSize(140.00), width: getSize(140.00), margin: getMargin(top: 40)), Spacer(), Container(height: getVerticalSize(5.00), width: getHorizontalSize(135.00), margin: getMargin(bottom: 3), decoration: BoxDecoration(color: ColorConstant.black900, borderRadius: BorderRadius.circular(getHorizontalSize(2.00))))])))); } 
onTapArrowleft24() { Get.back(); } 
 }
