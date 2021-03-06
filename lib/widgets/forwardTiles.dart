import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prive/counterState.dart';
import 'package:prive/size_config.dart';
import 'package:shimmer/shimmer.dart';

import '../app_theme.dart';

class ForwardTiles extends StatefulWidget {
  final String conversation;
  const ForwardTiles({@required this.conversation});

  @override
  _ForwardTilesState createState() => _ForwardTilesState();
}

class _ForwardTilesState extends State<ForwardTiles> {
  Controller controller = Get.find();
  String contact = '';
  bool loading;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.conversation != null) {
      String contact = widget.conversation.split('-')[0] == controller.user.name
          ? widget.conversation.split('-')[1]
          : widget.conversation.split('-')[0];
      return Container(
          margin: EdgeInsets.symmetric(
              horizontal: getWidth(15), vertical: getHeight(15)),
          child: Row(
            children: [
              CircleAvatar(
                radius: getText(30),
                // foregroundColor: Colors.white,
                // backgroundColor: MyTheme.kAccentColorVariant,
                child: Text(
                  contact[0].toUpperCase(),
                ),
              ),
              SizedBox(
                width: getWidth(20),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        contact[0].toUpperCase() + contact.substring(1),
                        style: MyTheme.heading2.copyWith(
                          fontSize: getText(16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ));
    } else {
      return Container(
        width: getWidth(200),
        height: getHeight(100),
        child: Container(
          margin: EdgeInsets.all(getWidth(15)),
          child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[200],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: getText(30),
                    // foregroundColor: Colors.white,
                    // backgroundColor: MyTheme.kAccentColorVariant,
                  ),
                  SizedBox(
                    width: getWidth(20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: getWidth(150),
                        height: getHeight(20),
                        color: Colors.amber,
                      ),
                      Container(
                        width: getWidth(240),
                        height: getHeight(20),
                        color: Colors.amber,
                      )
                    ],
                  ),
                ],
              )),
        ),
      );
    }
  }
}
