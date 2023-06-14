import 'package:chat_gpt_application/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SendIconButton extends StatelessWidget {
  const SendIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: IconButton(onPressed: ()async {

        try {
        await   ApiServices.getQueryResponse();
          
        } catch (e) {

          print(e);
          
        }
        
      }, icon: Icon(Icons.send_rounded,color: Colors.indigo,size: 30,)),
    );
  }
}