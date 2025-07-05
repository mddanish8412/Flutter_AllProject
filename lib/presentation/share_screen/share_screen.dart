import 'package:blog/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:blog/core/app_export.dart';
import 'controller/share_controller.dart';

class ShareScreen extends GetWidget<ShareController> {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 27.v),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 10.h, top: 9.v, bottom: 2.v),
                          child: Column(children: [
                            SizedBox(
                                width: 257.h,
                                child: Text("msg_work_with_your_team".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.displaySmall!
                                        .copyWith(height: 1.11))),
                            SizedBox(height: 15.v),
                            SizedBox(
                                width: 255.h,
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "msg_figjam_s_better2".tr,
                                          style: CustomTextStyles
                                              .titleMediumff000000_1),
                                      TextSpan(
                                          text: "lbl_share".tr,
                                          style: CustomTextStyles
                                              .titleMediumff000000),
                                      TextSpan(
                                          text: "msg_button_above_to".tr,
                                          style: CustomTextStyles
                                              .titleMediumff000000_1)
                                    ]),
                                    textAlign: TextAlign.left))
                          ])),
                      Container(
                          height: 168.v,
                          width: 228.h,
                          margin: EdgeInsets.only(bottom: 14.v),
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgImage21,
                                height: 146.v,
                                width: 228.h,
                                radius: BorderRadius.circular(1.h),
                                alignment: Alignment.bottomCenter),
                            CustomElevatedButton(
                                width: 97.h,
                                text: "lbl_share".tr,
                                margin: EdgeInsets.only(right: 28.h),
                                leftIcon: Container(
                                    margin: EdgeInsets.only(right: 10.h),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgIcon,
                                        height: 19.v,
                                        width: 15.h)),
                                alignment: Alignment.topRight)
                          ]))
                    ]))));
  }
}
