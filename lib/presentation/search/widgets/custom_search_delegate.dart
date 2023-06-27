import 'package:chatapp/presentation/search/bloc/search_bloc.dart';
import 'package:chatapp/presentation/search/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != "") {
      context.read<SearchBloc>().add(SearchInputChanged(query: query));
    }

    return const SearchPage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != "") {
      context.read<SearchBloc>().add(SearchInputChanged(query: query));
    }

    return const SearchPage();
  }
}
