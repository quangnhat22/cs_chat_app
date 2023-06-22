import 'package:chatapp/common/widgets/stateless/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CountdownButtonSend extends StatefulWidget {
  const CountdownButtonSend({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  State<CountdownButtonSend> createState() => _CountdownButtonSendState();
}

class _CountdownButtonSendState extends State<CountdownButtonSend> {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 5;
  bool isAbleButton = false;

  @override
  void initState() {
    super.initState();
    animationStart();
  }

  void animationStart() {
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    setState(() {
      isAbleButton = true;
    });
  }

  void _onPressed() {
    widget.onPressed;
    setState(() {
      endTime = DateTime.now().millisecondsSinceEpoch +
          const Duration(seconds: 5).inMilliseconds;
      isAbleButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CountdownTimer(
          endTime: endTime,
          onEnd: onEnd, // send the function
          widgetBuilder: ((_, time) {
            return CustomElevatedButton(
              buttonText: (time == null)
                  ? AppLocalizations.of(context)!.click_send_email
                  : "${AppLocalizations.of(context)!.resend_email_after}: ${time.sec}",
              onPressed: _onPressed,
              isEnable: (time == null),
              backgroundColor: Theme.of(context).colorScheme.primary,
            );
          }),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
