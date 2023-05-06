import 'package:flutter/material.dart';

import '../../../../common/widgets/stateless/circle_avatar/custom_avatar_image.dart';

class TitleChatRoom extends StatelessWidget {
  const TitleChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const CustomAvatarImage(
          widthImage: 40,
          heightImage: 40,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Nguyen Van A',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Online',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        )
      ],
    );
  }
}
