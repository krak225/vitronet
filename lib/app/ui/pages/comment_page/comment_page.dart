import 'package:job_boarder/app/ui/theme/light_color.dart';

import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/comment_controller.dart';
import 'widgets/comment_header_box_widget.dart';

class CommentPage extends GetView<CommentController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
      child: Column(
        children: [
          CommentHeaderBoxWidget(),
          // SizedBox(
          //   height: 20,
          // ),
          Expanded(
              child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: LightColor.lightGrey2,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          'Fatoumata',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('52 minutes ago'),
                        trailing: Image.asset(
                          'assets/icons/like-icon.png',
                          color: Colors.grey,
                        ),
                        // contentPadding: EdgeInsets.all(0),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                          style: TextStyle(color: LightColor.grey),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
