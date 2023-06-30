import 'package:chatapp/common/widgets/stateless/app_bar/m_page_app_bar.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/presentation/media/cubit/media_cubit.dart';
import 'package:chatapp/presentation/media/views/media_file.dart';
import 'package:chatapp/presentation/media/views/media_photo.dart';
import 'package:chatapp/presentation/media/views/media_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({super.key, required this.chatRoomId});

  final String chatRoomId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<MediaCubit>()..fetchListMessageMedia(chatRoomId: chatRoomId),
      child: const MediaView(),
    );
  }
}

class MediaView extends StatefulWidget {
  const MediaView({super.key});

  @override
  State<MediaView> createState() => _MediaViewState();
}

class _MediaViewState extends State<MediaView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MPageAppBar(
          title: AppLocalizations.of(context)!.view_photos_and_media_files,
          bottomWidget: TabBar(controller: _tabController, tabs: [
            Tab(
              child: Text(AppLocalizations.of(context)!.images),
            ),
            Tab(
              child: Text(AppLocalizations.of(context)!.video),
            ),
            Tab(
              child: Text(AppLocalizations.of(context)!.files),
            )
          ]),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            MediaPhoto(),
            MediaVideo(),
            MediaFile(),
          ],
        ),
      ),
    );
  }
}
