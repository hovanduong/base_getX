import 'package:base_getx/base/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BaseWidget<T extends BaseViewModel> extends StatelessWidget
    with ResponsiveWidget {
  final Widget Function(T viewmodel) builder;
  final Widget? childDesktop;
  final Widget? childMobile;
  final Widget? childTablet;
  final Widget? child;
  final T viewModel;

  BaseWidget(
      {required this.viewModel,
      required this.builder,
      this.child,
      this.childDesktop,
      this.childMobile,
      this.childTablet});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(init: viewModel, builder: builder);
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return childDesktop ?? child ?? SizedBox();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return childMobile ?? child ?? SizedBox();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return childDesktop ?? child ?? SizedBox();
  }
}

abstract class ResponsiveWidget {
  Widget buildDesktop(BuildContext context);

  Widget buildTablet(BuildContext context);

  Widget buildMobile(BuildContext context);
  Widget buildUi({required BuildContext context, Widget? defaultWidget}) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      if (sizeInfo.deviceScreenType == DeviceScreenType.desktop) {
        return buildDesktop(context);
      } else if (sizeInfo.deviceScreenType == DeviceScreenType.tablet) {
        return buildTablet(context);
      } else if (sizeInfo.deviceScreenType == DeviceScreenType.mobile) {
        return buildMobile(context);
      }
      return defaultWidget ?? SizedBox();
    });
  }
}
