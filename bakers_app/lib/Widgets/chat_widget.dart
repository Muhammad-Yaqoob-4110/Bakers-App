import 'package:bakers_app/Controller/inbox_controller.dart';
import 'package:bakers_app/Core/color.dart';
import 'text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  InboxController inboxController = Get.put(InboxController());

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    const double defaultPadding = 15.0;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: s.height * 0.02,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 27, 26, 26),
                borderRadius: BorderRadius.circular(12)),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Messages and calls are end-to-end encrypted.\n Tap to learn more.',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 223, 128),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: s.height * 0.03),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                itemCount: inboxController.messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: s.width * 0.6,
                          ),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(202, 39, 180, 93),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(0),
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Flexible(
                              child: Text(
                                inboxController.messages[index],
                                style: const TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: s.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFieldWidget(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 10, left: 20),
                enabledBorder: InputBorder.none,
                hintTextColor: mediumGrayColor,
                // inputBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                textfiledColor: const Color.fromARGB(255, 232, 232, 232),
                hintText: 'Type a message',
                controller: messageController,
                suffixIcon: IconButton(
                  onPressed: () {
                    inboxController.sendMessage(
                        messageController.text, messageController);
                  },
                  icon: const Icon(
                    Icons.send,
                  ),
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: s.height * 0.02,
          ),
        ],
      ),
    );
  }
}
