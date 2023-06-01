import 'package:chatapp/presentation/group/groups_request/widgets/group_received_request_list.dart';
import 'package:chatapp/presentation/group/groups_request/widgets/group_requests_segmented_button.dart';
import 'package:chatapp/presentation/group/groups_request/widgets/group_sent_request_list.dart';
import 'package:flutter/material.dart';

enum Request { sent, received }

class GroupRequestPage extends StatelessWidget {
  const GroupRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GroupRequestView();
  }
}

class GroupRequestView extends StatefulWidget {
  const GroupRequestView({super.key});

  @override
  State<GroupRequestView> createState() => _GroupRequestViewState();
}

class _GroupRequestViewState extends State<GroupRequestView> {
  Request view = Request.sent;

  void handleViewChange(Request selectedView) {
    setState(() {
      view = selectedView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GroupRequestsSegmentedButton(handleViewChange),
            ],
          ),
        ),
        view == Request.sent
            ? const GroupSentRequestList()
            : const GroupReceivedRequestList()
      ],
    ));
  }
}
