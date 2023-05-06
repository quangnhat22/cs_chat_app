import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Request { all, personal, group }

class SegmentButtonChat extends StatefulWidget {
  const SegmentButtonChat({super.key});

  @override
  State<SegmentButtonChat> createState() => _SegmentButtonChatState();
}

class _SegmentButtonChatState extends State<SegmentButtonChat> {
  Request view = Request.all;

  void handleViewChange(Request selectedView) {
    setState(() {
      view = selectedView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Request>(
      style: const ButtonStyle(alignment: AlignmentDirectional.center),
      segments: <ButtonSegment<Request>>[
        ButtonSegment(
            value: Request.all,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              child: Text(
                AppLocalizations.of(context)!.all,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            )),
        ButtonSegment(
            value: Request.personal,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              child: Text(
                AppLocalizations.of(context)!.personal,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            )),
        ButtonSegment(
            value: Request.group,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              child: Text(
                AppLocalizations.of(context)!.group,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            )),
      ],
      selected: <Request>{view},
      onSelectionChanged: (Set<Request> newSelection) {
        setState(() {
          view = newSelection.first;
          handleViewChange(newSelection.first);
        });
      },
    );
  }
}
