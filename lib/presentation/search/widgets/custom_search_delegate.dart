import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Lê Đức Hậu',
    'Lê Hà Gia Bảo',
    'Người bất ổn',
  ];
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
    List<String> matchQuery = [];
    for (var element in searchTerms) {
      if(element.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primaryContainer)),
          title: Text(result),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        );
      });
  }
  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchQuery = [];
    for (var element in searchTerms) {
      if(element.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primaryContainer)),
          title: Text(result),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        );
      });
  }
}