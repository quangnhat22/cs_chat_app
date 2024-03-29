import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/routes/app_navigation.dart';
import '../widgets/add_members.dart';
import '../widgets/input_name.dart';
import '../widgets/set_photo.dart';

class DetailChatRoomPage extends StatelessWidget {
  const DetailChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailChatRoomView();
  }
}

class DetailChatRoomView extends StatefulWidget {
  const DetailChatRoomView({super.key});

  @override
  State<DetailChatRoomView> createState() => _DetailChatRoomViewState();
}

class _DetailChatRoomViewState extends State<DetailChatRoomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.group_change_infomation),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            NavigationUtil.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          // ButtonGroupSubmit(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SetPhoto(),
              const InputName(),
              AddMembers(),
            ],
          ),
        ),
      ),
    );
  }
}
