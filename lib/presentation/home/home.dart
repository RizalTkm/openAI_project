import 'package:chat_gpt_application/constants/colors.dart';
import 'package:chat_gpt_application/constants/fonts.dart';
import 'package:chat_gpt_application/presentation/home/widgets/chat_widget.dart';
import 'package:chat_gpt_application/presentation/home/widgets/send_icon_button.dart';
import 'package:chat_gpt_application/presentation/home/widgets/textformfield_widget.dart';
import 'package:chat_gpt_application/services/api_services.dart';
import 'package:chat_gpt_application/services/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool istyping = false;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            title: const Center(child: Text("Chat Gpt")),
            leading: const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AssetManager.aiImage),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Icon(
                    Icons.menu_open_sharp,
                  ),
                  onTap: () async  {

                    print("button pressed");

                  //   ApiServices().getAiModels();
                 await  ApiServices.getAiModelsHttp(); 
                  },
                ),
              )
            ],
          )),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: ChatSample.sampleMessages.length,
                  itemBuilder: (context, index) {
                    final message =
                        ChatSample.sampleMessages[index]["message"].toString();
                    final messageValue =
                        ChatSample.sampleMessages[index]["value"];

                    return ChatTextWidget(
                      message: message,
                      textColor: customewhitecolor,
                      chatBackGroundColor: messageValue == 0
                          ? mainScaffoldColor
                          : customgreyColor,
                      imagePath: messageValue == 0
                          ? AssetManager.useriImage
                          : AssetManager.aiImage,
                      circleAvatarBackgroundColor: messageValue == 0
                          ? mainScaffoldColor
                          : customgreyColor,
                    );
                  }),
            ),
            istyping == true
                ? SpinKitDoubleBounce(
                    color: customewhitecolor,
                  )
                : const SizedBox(),
            Row(
              children: const [
                Expanded(
                  child: TextFormFieldWidget(),
                ),
                SendIconButton()
              ],
            )
          ],
        )),
      ),
    );
  }
}
