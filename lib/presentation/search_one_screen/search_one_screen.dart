import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:vedanta_lrms/data/apiClient/api_client.dart';
import 'package:vedanta_lrms/presentation/map_page/map_screen.dart';
import 'package:vedanta_lrms/presentation/search_one_screen/models/search_one_model.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';

import '../../widgets/custom_page.dart';
import 'controller/search_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';

class SearchOneScreen extends GetWidget<SearchOneController> {
String removeFileExtension(String fileName) {
  int dotIndex = fileName.lastIndexOf('.');
  
  // Check if the dot is found and is not the first character
  if (dotIndex != -1 && dotIndex < fileName.length - 1) {
    return fileName.substring(0, dotIndex);
  } else {
    // No extension or dot is the last character
    return fileName;
  }
}

  @override
  Widget build(BuildContext context) {

    return CustomPage(widget: get_page());
  }

// ignore: non_constant_identifier_names
  Widget get_page() {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: ColorfulSafeArea(
          minimum: EdgeInsets.only(top: 32),
          color: ColorConstant.whiteA700,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ColorConstant.lightGray,
              appBar: CustomAppBar(
                //minimum:EdgeInsets.only(top: 32),
                height: getVerticalSize(57.00),
                leadingWidth: 44,
                leading: AppbarImage(
                    height: getSize(32.00),
                    width: getSize(32.00),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 20, top: 12, bottom: 12),
                    onTap: () {
                      Get.back();
                    }),
                centerTitle: false,
                title: AppbarSubtitle(
                    text: "lbl_search".tr, margin: EdgeInsets.only(left: 16)),
              ),

              // CustomAppBar(
              //     height: getVerticalSize(57.00),
              //     leadingWidth: 44,
              //     leading: AppbarImage(
              //         height: getSize(24.00),
              //         width: getSize(24.00),
              //         svgPath: ImageConstant.imgArrowleftWhiteA700,
              //         margin: getMargin(left: 20, top: 17, bottom: 16),
              //         onTap: (){Get.back();}),
              //     centerTitle: true,
              //     title: AppbarSubtitle(text: "lbl_search".tr),
              //     styleType: Style.bgFillblueA200),
              body: Column(children: [
                Container(
                  width: double.infinity,
                  color: ColorConstant.whiteA700,
                  child: Padding(
                    padding:
                        getPadding(top: 0, bottom: 16, left: 20, right: 20),
                    child: CustomTextFormField(
                        shadowTextfield: false,
                        onChanged: (value) {
                          controller.setAdress(value);
                        },
                        onFieldSubmitted: (value) {
                          Get.back();
                        },
                        function: () {
                          // Get.to(AppRoutes.hom)
                        },
                        width: 388,
                        focusNode: FocusNode(),
                        controller: controller.group267Controller,
                        hintText: "lbl_search_location".tr,
                        margin: getMargin(top: 1),
                        variant: TextFormFieldVariant.OutlineGray400,
                        shape: TextFormFieldShape.RoundedBorder10,
                        padding: TextFormFieldPadding.PaddingT14_1,
                        fontStyle: TextFormFieldFontStyle.SFUITextRegular17,
                        textInputAction: TextInputAction.done,
                        prefix: Container(
                            margin: getMargin(
                                left: 16, top: 12, right: 8, bottom: 12),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgContrast)),
                        prefixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(48.00)),
                        suffix: Container(
                            margin: getMargin(
                                left: 30, top: 12, right: 16, bottom: 12),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgMicrophone)),
                        suffixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(48.00))),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<LayerList>(
                    future: ApiClient().getLayerList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        print(snapshot);
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // print(snapshot);
                        final ListLayers = snapshot.data!;
                        print('ListLayers $ListLayers');
                        return ListView.builder(
                          itemCount: ListLayers.mapLayerVillages!.length,
                          //  itemCount: 50,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                                width: double.infinity,
                                padding: getPadding(
                                  all: 16,
                                ),
                                decoration:
                                    AppDecoration.outlineGray300.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder4,
                                ),
                                child: ExpansionTile(
                                  title: Text(ListLayers
                                      .mapLayerVillages![index].name
                                      .toString()), //header title
                                  children: [
                                    Container(
                                      color: ColorConstant.whiteA700,
                                      padding: EdgeInsets.all(20),
                                      width: double.infinity,
                                      child: ListTile(
                                        leading: const Icon(Icons.map_outlined),
                                        title: Text(
                                          removeFileExtension(
                                          ListLayers.mapLayerVillages![index].value![0].name.toString()),
                                          textScaleFactor: 1,
                                        ),
                                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                                        // subtitle:
                                        //     const Text('This is subtitle'),
                                        // selected: true,
                                        onTap: () {
                                          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapScreen(id: ListLayers.mapLayerVillages![index].value![0].id),
              ),
            );
                                        },
                                      ),
                                    )
                                  ],
                                )
                                // Column(
                                //   mainAxisSize: MainAxisSize.min,
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.center,
                                //   children: [
                                //     Padding(
                                //       padding: getPadding(
                                //         top: 1,
                                //       ),
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.start,
                                //             children: [
                                //               Text(
                                //                 ListLayers.mapLayerVillages![index].name.toString(),
                                //                 // ' ListSurvey.results.',
                                //                 overflow:
                                //                     TextOverflow.ellipsis,
                                //                 textAlign: TextAlign.left,
                                //                 style: AppStyle
                                //                     .txtSFUITextBold17Width700black
                                //                     .copyWith(
                                //                   height: getVerticalSize(
                                //                     1.5,
                                //                   ),
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: getPadding(
                                //                   top: 5,
                                //                 ),
                                //                 child: RichText(
                                //                   text: TextSpan(
                                //                     children: [
                                //                       TextSpan(
                                //                         text:
                                //                             "lbl_large_truck2"
                                //                                 .tr,
                                //                         style: TextStyle(
                                //                           color:
                                //                               ColorConstant
                                //                                   .gray600,
                                //                           fontSize:
                                //                               getFontSize(
                                //                             17,
                                //                           ),
                                //                           fontFamily:
                                //                               'SF UI Text',
                                //                           fontWeight:
                                //                               FontWeight
                                //                                   .w400,
                                //                           height:
                                //                               getVerticalSize(
                                //                             1.5,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                       TextSpan(
                                //                         text: "lbl_rjgj6592"
                                //                             .tr,
                                //                         style: TextStyle(
                                //                           color:
                                //                               ColorConstant
                                //                                   .gray600,
                                //                           fontSize:
                                //                               getFontSize(
                                //                             17,
                                //                           ),
                                //                           fontFamily:
                                //                               'SF UI Text',
                                //                           fontWeight:
                                //                               FontWeight
                                //                                   .w400,
                                //                           height:
                                //                               getVerticalSize(
                                //                             1.08,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                   textAlign: TextAlign.left,
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: getPadding(
                                //                   top: 15,
                                //                 ),
                                //                 child: Row(
                                //                   children: [
                                //                     CustomImageView(
                                //                       svgPath: ImageConstant
                                //                           .imgLocationGray600,
                                //                       height: getSize(
                                //                         24.00,
                                //                       ),
                                //                       width: getSize(
                                //                         24.00,
                                //                       ),
                                //                     ),
                                //                     Padding(
                                //                       padding: getPadding(
                                //                         left: 16,
                                //                         top: 1,
                                //                         bottom: 1,
                                //                       ),
                                //                       child: Text(
                                //                         "Naperville",
                                //                         overflow:
                                //                             TextOverflow
                                //                                 .ellipsis,
                                //                         textAlign:
                                //                             TextAlign.left,
                                //                         style: AppStyle
                                //                             .txtSFUITextRegular17
                                //                             .copyWith(
                                //                           height:
                                //                               getVerticalSize(
                                //                             1.08,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: getPadding(
                                //                   top: 16,
                                //                 ),
                                //                 child: Row(
                                //                   children: [
                                //                     CustomImageView(
                                //                       svgPath: ImageConstant
                                //                           .imgLocationGray60024x24,
                                //                       height: getSize(
                                //                         24.00,
                                //                       ),
                                //                       width: getSize(
                                //                         24.00,
                                //                       ),
                                //                     ),
                                //                     Padding(
                                //                       padding: getPadding(
                                //                         left: 16,
                                //                         top: 3,
                                //                       ),
                                //                       child: Text(
                                //                         "Austin",
                                //                         overflow:
                                //                             TextOverflow
                                //                                 .ellipsis,
                                //                         textAlign:
                                //                             TextAlign.left,
                                //                         style: AppStyle
                                //                             .txtSFUITextRegular17
                                //                             .copyWith(
                                //                           height:
                                //                               getVerticalSize(
                                //                             1.08,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //           Padding(
                                //             padding: getPadding(
                                //               top: 14,
                                //               bottom: 90,
                                //             ),
                                //             child: Text(
                                //               "lbl_458_00".tr,
                                //               overflow:
                                //                   TextOverflow.ellipsis,
                                //               textAlign: TextAlign.left,
                                //               style: AppStyle
                                //                   .txtSFUITextBold17blueA200
                                //                   .copyWith(
                                //                 height: getVerticalSize(
                                //                   1.08,
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: getPadding(
                                //         top: 16,
                                //       ),
                                //       child: Row(
                                //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           CustomButton(
                                //               onTap: () {
                                //                 Get.toNamed(AppRoutes
                                //                     .historyOneScreen);
                                //               },
                                //               shape: ButtonShape
                                //                   .RoundedBorder4,
                                //               height: 36,
                                //               width: 135,
                                //               text: "lbl_view_details".tr,
                                //               margin: getMargin(bottom: 1),
                                //               variant: ButtonVariant
                                //                   .OutlineblueA200_2,
                                //               padding:
                                //                   ButtonPadding.PaddingAll9,
                                //               fontStyle: ButtonFontStyle
                                //                   .SFUITextBold14),

                                //           // CustomButton(
                                //           //   onTap: (){
                                //           //     Get.toNamed(AppRoutes.historyOneScreen);
                                //           //   },
                                //           //   height: 36,
                                //           //
                                //           //   text: "lbl_view_details".tr,
                                //           //   variant: ButtonVariant.OutlineblueA200_2,
                                //           //   padding: ButtonPadding.PaddingAll9,
                                //           //   fontStyle: ButtonFontStyle.SFUITextBold14,
                                //           // ),
                                //           SizedBox(
                                //             width: 10,
                                //           ),
                                //           // Container(
                                //           //   width: getHorizontalSize(
                                //           //     66.00,
                                //           //   ),
                                //           //   margin: getMargin(
                                //           //     top: 4,
                                //           //   ),
                                //           //   padding: getPadding(
                                //           //     left: 8,
                                //           //     top: 3,
                                //           //     right: 8,
                                //           //     bottom: 3,
                                //           //   ),
                                //           //   decoration: AppDecoration.txtFillblue50.copyWith(
                                //           //     borderRadius: BorderRadiusStyle.txtRoundedBorder4,
                                //           //   ),
                                //           //   child: Text(
                                //           //     "lbl_pending".tr,
                                //           //     overflow: TextOverflow.ellipsis,
                                //           //     textAlign: TextAlign.center,
                                //           //     style: AppStyle.txtSFUITextRegular13blueA200.copyWith(
                                //           //       height: getVerticalSize(
                                //           //         3.0,
                                //           //       ),
                                //           //     ),
                                //           //   ),
                                //           // ),
                                //           CustomButton(
                                //               onTap: () {},
                                //               shape: ButtonShape
                                //                   .RoundedBorder4,
                                //               height: 36,
                                //               width: 135,
                                //               text: "lbl_pending".tr,
                                //               margin: getMargin(bottom: 1),
                                //               variant: ButtonVariant
                                //                   .OutlineredA200_2,
                                //               padding:
                                //                   ButtonPadding.PaddingAll9,
                                //               fontStyle: ButtonFontStyle
                                //                   .SFUITextBold15),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                );
                          },
                        );
                      }
                    },
                  ),
                )
              ]))),
    );
  }

  onTapArrowleft6(context) {
    Get.back();
  }
}
