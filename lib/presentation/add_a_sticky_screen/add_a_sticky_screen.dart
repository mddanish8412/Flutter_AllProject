import 'package:blog/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:blog/core/app_export.dart';
import 'controller/add_a_sticky_controller.dart';

// ignore_for_file: must_be_immutable
class AddAStickyScreen extends GetWidget<AddAStickyController> {
  const AddAStickyScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.v),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 36.h,
                  top: 26.v,
                  bottom: 26.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_stickies".tr,
                      style: theme.textTheme.displaySmall,
                    ),
                    SizedBox(height: 15.v),
                    SizedBox(
                      width: 281.h,
                      child: Text(
                        "msg_press_s_to_quickly".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium!.copyWith(
                          height: 1.33,
                        ),
                      ),
                    ),
                    SizedBox(height: 34.v),
                    CustomOutlinedButton(
                      width: 44.h,
                      text: "lbl_s".tr,
                    ),
                  ],
                ),
              ),
              Container(
                height: 220.v,
                width: 204.h,
                margin: EdgeInsets.only(bottom: 21.v),
                padding: EdgeInsets.symmetric(
                  horizontal: 38.h,
                  vertical: 22.v,
                ),
                decoration: AppDecoration.outlineBlack900,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 12.v,
                        width: 2.h,
                        decoration: BoxDecoration(
                          color: appTheme.black900,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 54.h,
                        child: Text(
                          "lbl_add_text".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge!.copyWith(
                            height: 1.50,
                          ),
                        ),
                      ),
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
