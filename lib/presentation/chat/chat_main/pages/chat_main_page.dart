import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/presentation/chat/chat_main/bloc/list_chat_room_bloc.dart';
import 'package:chatapp/presentation/chat/chat_main/widgets/list_chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/app_bar/m_home_app_bar.dart';

class ChatMainPage extends StatelessWidget {
  const ChatMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ListChatRoomBloc>()
        ..add(const ListChatRoomEvent.inited())
        ..add(const ListChatRoomEvent.started()),
      child: const ChatMainView(),
    );
  }
}

class ChatMainView extends StatelessWidget {
  const ChatMainView({
    super.key,
  });

  void _refreshedList(BuildContext ctx) async {
    ctx.read<ListChatRoomBloc>().add(const ListChatRoomRefreshed());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.chat,
      ),
      body: RefreshIndicator(
        onRefresh: () async => _refreshedList(context),
        child: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: <Widget>[ListChatRoom()],
        ),
      ),
    );
  }
}
