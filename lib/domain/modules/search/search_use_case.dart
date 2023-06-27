import 'package:chatapp/domain/modules/search/search_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/search_entity.dart';

abstract class SearchUseCase {
  Future<SearchEntity?> searchGlobally(String? query);
}

@Injectable(as: SearchUseCase)
class SearchUseCaseImpl extends SearchUseCase {
  final SearchRepository repo;

  SearchUseCaseImpl({required this.repo});

  @override
  Future<SearchEntity?> searchGlobally(String? query) async {
    return await repo.searchGlobally(query);
  }
}
