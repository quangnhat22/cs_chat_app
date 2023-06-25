import 'package:injectable/injectable.dart';

import '../../domain/entities/search_entity.dart';
import '../../domain/modules/search/search_repository.dart';
import '../data_sources/remote/service/search_service.dart';
import '../models/search_model.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository {
  SearchRepositoryImpl({required SearchService service}) : _service = service;

  final SearchService _service;

  @override
  Future<SearchEntity?> searchGlobally(String? query) async {
    try {
      final res = await _service.searchGlobally(query);
      if (res.statusCode == 200) {
        final searchModel = SearchModel.fromJson(res.data["data"]);
        final searchEntity =
            SearchEntity.convertToSearchEntity(model: searchModel);

        return searchEntity;
      }

      return SearchEntity.searchEntityEmpty;
    } catch (e) {
      throw Exception(e..toString());
    }
  }
}
