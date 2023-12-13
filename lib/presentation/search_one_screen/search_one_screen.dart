import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/data/apiClient/api_client.dart';
import 'package:vedanta_lrms/presentation/map_page/map_screen.dart';
import 'package:vedanta_lrms/presentation/search_one_screen/models/search_one_model.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';

class SearchOneScreen extends StatefulWidget {
  const SearchOneScreen({super.key});

  @override
  State<SearchOneScreen> createState() => _SearchOneScreenState();
}

class _SearchOneScreenState extends State<SearchOneScreen> {
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

  TextEditingController group267Controller = TextEditingController();
  String? address;
  @override
  @override
  void onClose() {
    group267Controller.dispose();
  }

  void setAdress(String value) {
    address = value;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    group267Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          setAdress(value);
                        },
                        onFieldSubmitted: (value) {
                          Get.back();
                        },
                        function: () {
                          // Get.to(AppRoutes.hom)
                        },
                        width: 388,
                        focusNode: FocusNode(),
                        controller: group267Controller,
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
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemCount: ListLayers
                                              .mapLayerVillages![index]
                                              .value!
                                              .length,
                                          //  itemCount: 5,
                                          // physics: ScrollPhysics(),
                                          itemBuilder: (context, ind) {
                                            return Container(
                                                color: ColorConstant.whiteA700,
                                                padding: EdgeInsets.all(20),
                                                width: double.infinity,
                                                child: ListTile(
                                                  leading: const Icon(
                                                      Icons.map_outlined),
                                                  title: Text(
                                                    removeFileExtension(
                                                        ListLayers
                                                            .mapLayerVillages![
                                                                index]
                                                            .value![ind]
                                                            .originalName
                                                            .toString()),
                                                    // "${ListLayers
                                                    // .mapLayerVillages![index]
                                                    // .value![ind]
                                                    // .originalName
                                                    // .toString()}",
                                                    // "ListLayers",
                                                    textScaleFactor: 1,
                                                  ),
                                                  trailing: const Icon(Icons
                                                      .arrow_forward_ios_outlined),
                                                  // subtitle:
                                                  //     const Text('This is subtitle'),
                                                  // selected: true,
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            MapScreen(
                                                                id: ListLayers
                                                                    .mapLayerVillages![
                                                                        index]
                                                                    .value![ind]
                                                                    .id),
                                                      ),
                                                    );
                                                  },
                                                )
                                                // })
                                                );
                                          }),
                                    )
                                  ],
                                ));
                            // });
                          },
                        );
                      }
                    },
                  ),
                )
              ]))),
    );
  }
}
