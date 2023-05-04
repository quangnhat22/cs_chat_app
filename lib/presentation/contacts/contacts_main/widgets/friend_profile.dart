import 'package:chatapp/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FriendProfile extends StatefulWidget {
  const FriendProfile({super.key});

  @override
  State<FriendProfile> createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.lightColorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        Expanded(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    maxRadius: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Nguyễn Đình Nhật Quang',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.email_verified,
                            style: const TextStyle(
                                color: Colors.green, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.email,
                            color: Colors.grey,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "quangnguyen221202@gmail.com",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.phone,
                            color: Colors.grey,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "0367780567",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.info_outline,
                            color: Colors.grey,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Hello, I’m Quang",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10)),
                      backgroundColor: MaterialStateProperty.all(
                          AppColors.lightColorScheme.primary),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.add_friend,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )),
        )
      ]),
    );
  }
}
