import 'package:dio/dio.dart';

import '../models/dog_img_random_model.dart';
import '../models/dog_name_model.dart';
// import 'package:dog_api_riverpod/service/models/dog_name_model.dart';

class DogsInformation {
  final dio = Dio();

  // Future<List<String>> getDogsName() async {
  //   const String urlList = 'https://dog.ceo/api/breeds/list/all';
  //   try {
  //     Response response = await dio.get(urlList);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> dogsData =
  //           Map<String, dynamic>.from(response.data['message']);

  //       List<String> dogs = dogsData.keys.toList();

  //       return dogs;
  //     } else {
  //       throw Exception('Failed to load pokemons: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load pokemons: $e');
  //   }
  // }

  Future<DogNameModel> getDogsName() async {
    const String urlList = 'https://dog.ceo/api/breeds/list/all';
    try {
      Response response = await dio.get(urlList);
      if (response.statusCode == 200) {
        DogNameModel dogsData = DogNameModel.fromJson(response.data['message']);

        return dogsData;
      } else {
        throw Exception('Failed to load dog names: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load dog names: $e');
    }
  }

  Future<DogImageRandomModel> getDogsRandom() async {
    const String urlList = 'https://dog.ceo/api/breeds/image/random';
    try {
      Response response = await dio.get(urlList);
      if (response.statusCode == 200) {
        DogImageRandomModel radomDogData =
            DogImageRandomModel.fromJson(response.data);
        return radomDogData;
      } else {
        throw Exception('Failed to load pokemons: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load pokemons: $e');
    }
  }

  Future<DogImageRandomModel> getSpecificDogRandom(String name) async {
    final String urlList = 'https://dog.ceo/api/breed/$name/images/random';
    try {
      Response response = await dio.get(urlList);
      if (response.statusCode == 200) {
        DogImageRandomModel radomDogData =
            DogImageRandomModel.fromJson(response.data);
        return radomDogData;
      } else {
        throw Exception('Failed to load pokemons: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load pokemons: $e');
    }
  }
}
