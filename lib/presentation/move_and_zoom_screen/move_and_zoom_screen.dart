import 'package:blog/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:blog/core/app_export.dart';
import 'controller/move_and_zoom_controller.dart';

// ignore_for_file: must_be_immutable
class MoveAndZoomScreen extends GetWidget<MoveAndZoomController> {
  const MoveAndZoomScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 17.h,
            vertical: 28.v,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_move_and_zoom".tr,
                      style: theme.textTheme.displaySmall,
                    ),
                    SizedBox(height: 6.v),
                    SizedBox(
                      width: 268.h,
                      child: Text(
                        "msg_holding_spacebar".tr,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 27.v),
                    CustomOutlinedButton(
                      height: 37.v,
                      width: 98.h,
                      text: "lbl_spacebar".tr,
                      buttonStyle: CustomButtonStyles.outlineBlackTL5,
                      buttonTextStyle: CustomTextStyles.titleMedium16,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 43.v,
                  bottom: 14.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup2204,
                      height: 50.v,
                      width: 105.h,
                    ),
                    SizedBox(height: 23.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgScreenShot20220919,
                      height: 64.v,
                      width: 179.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
