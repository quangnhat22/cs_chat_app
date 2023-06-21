part of find_new_friend;

class ButtonFindFriend extends StatelessWidget {
  const ButtonFindFriend({super.key});

  void _handleSubmitFindBtn(BuildContext ctx, String? email) {
    if (email == null) return;
    ctx.read<FindFriendBloc>().add(FindFriendEvent.submitButton(email: email));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindFriendBloc, FindFriendState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, FindFriendState findFriendState) {
        return BlocBuilder<FindFriendFormCubit, FindFriendFormState>(
          builder: (context, state) {
            return findFriendState.maybeWhen(
              inProgress: () => const CircularProgressIndicator(),
              orElse: () {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomElevatedButton(
                    buttonText: AppLocalizations.of(context)!.find_friend,
                    onPressed: () =>
                        _handleSubmitFindBtn(context, state.email?.value),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
