part of friends_request;

class SegmentButtonFriendRequest extends StatefulWidget {
  final Function onViewChange;

  const SegmentButtonFriendRequest(this.onViewChange, {super.key});

  @override
  State<SegmentButtonFriendRequest> createState() =>
      _SegmentButtonFriendRequestState();
}

class _SegmentButtonFriendRequestState
    extends State<SegmentButtonFriendRequest> {
  Request requestView = Request.sent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListFriendRequestBloc, ListFriendRequestState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final listSentRequest = (state is GetListFriendRequestSuccess &&
                state.friendRequestSent.isNotEmpty)
            ? state.friendRequestSent.length.toString()
            : "";
        final listReceiveRequest = (state is GetListFriendRequestSuccess &&
                state.friendRequestReceive.isNotEmpty)
            ? state.friendRequestReceive.length.toString()
            : "";
        return SegmentedButton<Request>(
          style: const ButtonStyle(alignment: AlignmentDirectional.center),
          segments: <ButtonSegment<Request>>[
            ButtonSegment(
                value: Request.sent,
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "${AppLocalizations.of(context)!.requests_sent_text_button_segment} $listSentRequest",
                  ),
                )),
            ButtonSegment(
                value: Request.received,
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "${AppLocalizations.of(context)!.requests_receive_text_button_segment} $listReceiveRequest",
                  ),
                )),
          ],
          selected: <Request>{requestView},
          onSelectionChanged: (Set<Request> newSelection) {
            setState(() {
              requestView = newSelection.first;
              widget.onViewChange(newSelection.first);
            });
          },
        );
      },
    );
  }
}
