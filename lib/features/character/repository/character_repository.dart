import 'package:dio/dio.dart';
import '../../../core/dio_client.dart';
import '../model/character_model.dart';

class CharacterRepository {
  final Dio _dio = DioClient.createDio();

  Future<List<Character>> fetchCharacters() async {
    final response = await _dio.get('character');
    final results = response.data['results'] as List;
    return results.map((json) => Character.fromJson(json)).toList();
  }
}
