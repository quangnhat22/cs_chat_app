import 'package:chatapp/presentation/group/your_groups/your_groups.dart';
import 'package:chatapp/presentation/search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultGroup extends StatelessWidget {
  const ResultGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (prev, current) => prev.groups != current.groups,
      builder: (context, state) {
        if (state.groups != null && state.groups!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Your groups",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => ListGroupItem(
                  groupItem: state.groups![index],
                ),
                itemCount: state.groups!.length,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
