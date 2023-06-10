import 'package:chat_gpt_application/services/asset_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatTextWidget extends StatelessWidget {
  ChatTextWidget(
      {Key? key,
      required this.message,
      required this.textColor,
      required this.chatBackGroundColor,
      required this.imagePath,
      required this.circleAvatarBackgroundColor})
      : super(
          key: key,
        );

  String message;
  Color textColor;
  Color chatBackGroundColor;
  String imagePath;
  Color circleAvatarBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: chatBackGroundColor,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 20, backgroundImage: AssetImage(imagePath,),
          
          backgroundColor:circleAvatarBackgroundColor ,),
          SizedBox(width: 10,),
          Expanded(
              child: Text(
            message,
            style: TextStyle(color: textColor, fontSize: 20),
          )),
        ],
      ),
    );
  }
}
