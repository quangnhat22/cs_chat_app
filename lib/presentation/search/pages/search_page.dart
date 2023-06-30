import 'package:chatapp/presentation/search/bloc/search_bloc.dart';
import 'package:chatapp/presentation/search/widgets/result_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/result_friend.dart';
import '../widgets/result_group.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchView();
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                ResultFriend(),
                ResultGroup(),
                ResultMessage(),
              ],
            ),
          ),
        );
      },
    );
  }
}
