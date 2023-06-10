import 'package:chat_gpt_application/constants/colors.dart';
import 'package:flutter/material.dart';


class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              style: TextStyle(color: customewhitecolor),

              
              decoration:  InputDecoration(hintText: "Type something",hintStyle: TextStyle(color: customewhitecolor),
              fillColor:Color.fromARGB(255, 35, 61, 127),filled: true,
                border:const  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1.5,style: BorderStyle.solid,),) ),
              
            ),
          );
    
  }
}