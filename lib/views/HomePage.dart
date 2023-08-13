import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/movie_controller.dart';

class HomePage extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text('HomePage')
      )
    );
  }
}


