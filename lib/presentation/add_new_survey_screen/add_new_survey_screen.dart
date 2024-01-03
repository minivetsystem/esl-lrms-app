import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_drop_down.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AddNewSurvey extends StatefulWidget {
  const AddNewSurvey({super.key});

  @override
  State<AddNewSurvey> createState() => _AddNewSurveyState();
}

class _AddNewSurveyState extends State<AddNewSurvey> {
  TextEditingController masterInputOneController = TextEditingController();

  TextEditingController masterInputThreeController = TextEditingController();

  TextEditingController masterInputFourController = TextEditingController();

  List<dynamic> stateList = [];
  RxList<SelectionPopupModel> districtList = RxList<SelectionPopupModel>();
  RxList<SelectionPopupModel> updatedList = RxList<SelectionPopupModel>();

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;
  var dropdownValue;
  int? selectState;
  List<dynamic> states = [];
  getStateList() async {
    EasyLoading.show(status: 'Loading state...');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response =
        await http.get(Uri.parse('${Constant.baseurl}state-list'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> list = json.decode(response.body);

      setState(() {
        states = list['states'];
        stateList = list['states'];
        // for (var state in states) {
        //   stateList.add(
        //     SelectionPopupModel(
        //         id: state['id'], title: state['name'], isSelected: false),
        //   );
        // }
        //  stateList = updatedList;
      });
      print(stateList);
      EasyLoading.dismiss();
    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    super.initState();
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
    getStateList();
    // Start auto-scrolling every 3 seconds
  }

  refreshFc() {
    selectState = 0;
    setState(() {
        dropdownValue = null;
    });
  
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    // stateList.forEach((element) {
    //   element.isSelected = false;
    //   if (element.id == value.id) {

    //     element.isSelected = true;
    //   }
    // });
    // stateList.refresh();
  }

  onSelected1(dynamic value) {
    selectedDropDownValue1 = value as SelectionPopupModel;
    districtList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    districtList.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        minimum: EdgeInsets.only(top: 20),
        color: ColorConstant.whiteA700,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.lightGray,
            appBar: CustomAppBar(
              // minimum:EdgeInsets.only(top: 20),
              height: getVerticalSize(57.00),
              centerTitle: true,
              leadingWidth: 44,
              leading: AppbarImage(
                  height: getSize(15.00),
                  width: getSize(15.00),
                  svgPath: ImageConstant.imgCross,
                  margin: getMargin(left: 20, top: 17, bottom: 16),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              title: AppbarSubtitle(
                  text: "lbl_add_new_survey".tr, margin: getMargin(left: 16)),
              styleType: Style.bgFillblueA200,
              actions: [
                Container(
                  margin: getMargin(
                    left: 20,
                    top: 7,
                    right: 20,
                    bottom: 19,
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check,
                      )),
                )
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                await refreshFc();
              },
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Container(
                        width: size.width,
                        padding:
                            getPadding(top: 10, bottom: 12, left: 0, right: 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                color: ColorConstant.whiteA700,
                                child: Padding(
                                  padding: getPadding(
                                      left: 20, right: 20, top: 16, bottom: 16),
                                  child: Column(
                                    children: [
                                      //  CustomDropDown(
                                      //     width: double.infinity,
                                      //     focusNode: FocusNode(),
                                      //     icon: Container(
                                      //         margin: getMargin(left: 30, right: 16),
                                      //         child: CustomImageView(
                                      //             svgPath: ImageConstant
                                      //                 .imgArrowdownBlack900)),
                                      //     hintText: "lbl_state".tr,
                                      //     items:
                                      //         stateList,
                                      //     onChanged: (value) {
                                      //       setState(() {
                                      //         selectState = value.id;
                                      //       });
                                      //       // onSelected(value);
                                      //     }
                                      //     ),
                                    Container(
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.0),
            ),
                                      child: DropdownButton(
                                        hint: Text('Select State'),
                                         isExpanded: true,
                                        underline: Container(),
                                            value: dropdownValue,
                                            icon: const Icon(Icons.arrow_downward_outlined,
                                            ),
                                            elevation: 20,
                                            style: const TextStyle(color: Colors.black54),
                                            onChanged: ( value) {
                                              // This is called when the user selects an item.
                                              setState(() {
                                                dropdownValue = value;
                                              });
                                            },
                                            items: stateList.map<DropdownMenuItem>(( value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Text(value['name'])
                                              );
                                            }).toList(),
                                          ),
                                    ),
                                      CustomTextFormField(
                                          shadowTextfield: false,
                                          width: double.infinity,
                                          focusNode: FocusNode(),
                                          // controller:
                                          //     controller.masterInputOneController,
                                          hintText: "lbl_565".tr,
                                          margin: getMargin(top: 16),
                                          padding: TextFormFieldPadding
                                              .PaddingAll14),
                                      Padding(
                                          padding: getPadding(top: 16),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        getPadding(right: 8),
                                                    child: CustomDropDown(
                                                        focusNode: FocusNode(),
                                                        icon: Container(
                                                            margin: getMargin(
                                                                left: 30,
                                                                right: 16),
                                                            child: CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgArrowdownBlack900)),
                                                        hintText:
                                                            "lbl_25_5_2022".tr,
                                                        items: districtList,
                                                        onChanged: (value) {
                                                          onSelected1(value);
                                                        }),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        getPadding(left: 8),
                                                    child: CustomTextFormField(
                                                        shadowTextfield: false,
                                                        focusNode: FocusNode(),
                                                        controller:
                                                            masterInputThreeController,
                                                        hintText: "lbl_658".tr,
                                                        padding:
                                                            TextFormFieldPadding
                                                                .PaddingAll14),
                                                  ),
                                                )
                                              ])),
                                      CustomTextFormField(
                                          shadowTextfield: false,
                                          width: double.infinity,
                                          focusNode: FocusNode(),
                                          // controller:
                                          //     ,
                                          hintText: "lbl_zohn_bell".tr,
                                          margin: getMargin(top: 16),
                                          padding:
                                              TextFormFieldPadding.PaddingAll14,
                                          textInputAction:
                                              TextInputAction.done),
                                      CustomButton(
                                          onTap: () {
                                            Get.back();
                                          },
                                          height: 50,
                                          width: 388,
                                          text: "lbl_add".tr,
                                          margin: getMargin(top: 32)),
                                    ],
                                  ),
                                ),
                              ),
                            ])),
                  )
                ],
              ),
            )));
  }
}
