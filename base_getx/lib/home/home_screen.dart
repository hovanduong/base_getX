import 'package:base_getx/base/base_widget.dart';
import 'package:base_getx/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget with ResponsiveWidget {
  HomeViewModel viewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      builder: (viewModel) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildUi(context: context),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return const Text('DeskTop');
  }

  @override
  Widget buildMobile(BuildContext context) {
    return Column(
      children: [
        Text('${viewModel.count}'),
        ElevatedButton(
            onPressed: () {
              viewModel.increment();
            },
            child: Text('Button'))
      ],
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return const Text('Table');
  }
}
