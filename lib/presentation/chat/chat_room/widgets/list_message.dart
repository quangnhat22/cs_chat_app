import 'package:chatapp/common/widgets/stateless/message/factory_message_item.dart';
import 'package:flutter/material.dart';

class ListMessage extends StatelessWidget {
  const ListMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                FactoryMessageItem.buildMessageItem(
                    "text", false, "hello", "ABC")
              ],
            ),
          );
        },
        childCount: 1000,
      ),
    );
  }
}
