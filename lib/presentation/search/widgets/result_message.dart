import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/presentation/search/bloc/search_bloc.dart';
import 'package:chatapp/presentation/search/widgets/result_message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultMessage extends StatelessWidget {
  const ResultMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.messages != null && state.messages!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8),
              const Text(
                "Your messages",
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
                itemBuilder: (context, index) => ResultMessageItem(
                    messageEntity: state.messages?[index] ??
                        MessageEntity.messageEntityEmpty),
                itemCount: state.messages!.length,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
