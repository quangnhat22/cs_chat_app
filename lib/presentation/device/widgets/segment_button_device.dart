import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Request { current, active }

class SegmentButtonDevice extends StatefulWidget {
  const SegmentButtonDevice({super.key});

  @override
  State<SegmentButtonDevice> createState() => _SegmentButtonDeviceState();
}

class _SegmentButtonDeviceState extends State<SegmentButtonDevice> {
  Request view = Request.current;

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
            value: Request.current,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              child: Text(
                AppLocalizations.of(context)!.current,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            )),
        ButtonSegment(
            value: Request.active,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              child: Text(
                AppLocalizations.of(context)!.active,
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
