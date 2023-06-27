import 'package:chatapp/common/widgets/stateless/app_bar/m_page_app_bar.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/presentation/group/group_details/bloc/group_details_bloc.dart';
import 'package:chatapp/presentation/group/group_details/widgets/group_detail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/group_details_small_card_bottom.dart';
import '../widgets/group_details_small_card_top.dart';

class GroupDetailPage extends StatelessWidget {
  const GroupDetailPage({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GroupDetailsBloc>()
        ..add(GroupDetailsEvent.started(id: groupId)),
      child: const GroupDetailView(),
    );
  }
}

class GroupDetailView extends StatelessWidget {
  const GroupDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupDetailsBloc, GroupDetailsState>(
      listener: (context, state) {
        state.whenOrNull(
          leaveGroupSuccess: () {
            SnackBarApp.showSnackBar(
                context, "Leave group fail! Try again.", TypesSnackBar.error);
          },
          leaveGroupFail: () {
            SnackBarApp.showSnackBar(
                context, "Leave group success", TypesSnackBar.success);
            NavigationUtil.pushNamedAndRemoveUntil(route: RouteName.homePage);
          },
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const MPageAppBar(title: "Details"),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const GroupDetaiInfo(),
                const GroupDetailsSmallCardTop(),
                SizedBox(
                  height: 4.h,
                ),
                const GroupDetailsSmallCardBottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
