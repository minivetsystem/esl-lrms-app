import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/select_payment_method_screen/models/select_payment_method_model.dart';

class SelectPaymentMethodController extends GetxController {
  Rx<SelectPaymentMethodModel> selectPaymentMethodModelObj =
      SelectPaymentMethodModel("","").obs;
  static List<SelectPaymentMethodModel> getData(){
    return [
      SelectPaymentMethodModel("lbl_google_pay".tr,ImageConstant.imgGpaylockup1),
      SelectPaymentMethodModel("lbl_visa".tr,ImageConstant.imgvisaPay),
      SelectPaymentMethodModel("lbl_paypal".tr,ImageConstant.imgPaypal21),
    ];
  }

  RxString radioGroup = "".obs;

  RxString radioGroup1 = "".obs;

  RxString radioGroup2 = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setValue(String value) {
    radioGroup.value = value;
    update();
  }
}
