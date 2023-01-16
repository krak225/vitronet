import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
            child: Center(
        child: Text('Search'),
      ),
    );
  }
}
