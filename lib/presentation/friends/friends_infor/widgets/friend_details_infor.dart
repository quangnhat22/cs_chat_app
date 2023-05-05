part of friends_infor;

class FriendDetailsInfor extends StatelessWidget {
  const FriendDetailsInfor({super.key});

  Widget _buildInfoItem(
      {required String title,
      required String subtitle,
      required IconData leading,
      required BuildContext ctx}) {
    return ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(
          leading,
          color: Theme.of(ctx).colorScheme.onPrimaryContainer,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, top: 90.h),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: BlocBuilder<FriendInfoCubit, FriendInfoState>(
          buildWhen: (previous, current) => previous.user != current.user,
          builder: (context, state) {
            return Column(
              children: <Widget>[
                _buildInfoItem(
                    title: AppLocalizations.of(context)!.full_name,
                    subtitle: state.user.name ?? "",
                    leading: Icons.badge,
                    ctx: context),
                const Divider(),
                _buildInfoItem(
                    title: AppLocalizations.of(context)!.email_label,
                    subtitle: state.user.email ?? "",
                    leading: Icons.email_outlined,
                    ctx: context),
                const Divider(),
                _buildInfoItem(
                    title: AppLocalizations.of(context)!.phone_number,
                    subtitle: state.user.phone ?? "",
                    leading: Icons.call_outlined,
                    ctx: context),
                const Divider(),
                _buildInfoItem(
                    title: AppLocalizations.of(context)!.gender,
                    subtitle: state.user.gender ?? "",
                    leading: Icons.people,
                    ctx: context),
                // const Divider(),
                // _buildInfoItem(
                //     title: AppLocalizations.of(context)!.birthday,
                //     subtitle: state.user.birthday == null
                //         ? AppDateTimeFormat.formatDDMMYYYY(state.user.birthday)
                //         : "",
                //     leading: Icons.people,
                //     ctx: context),
              ],
            );
          },
        ),
      ),
    );
  }
}
