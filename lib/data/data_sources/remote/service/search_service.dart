import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_service.dart';

@Injectable()
class SearchService {
  SearchService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> searchGlobally(String? query) async {
    try {
      return await _service.dio.get("${BaseService.searchPath}/term=$query");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
