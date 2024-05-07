import 'package:dog_api_riverpod/service/Services/dogs_information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/models/dog_img_random_model.dart';

final dogNameProvider = FutureProvider<List<String>>((ref) async {
  final dogName = await DogsInformation().getDogsName();
  return dogName;
});

final specificDogRandomProvider = FutureProvider.autoDispose
    .family<DogImageRandomModel, String>((ref, name) async {
  final dogRandom = await DogsInformation().getSpecificDogRandom(name);
  return dogRandom;
});

// final dogRandomProvider =
//     FutureProvider.autoDispose<DogImageRandomModel>((ref) async {
//   final dogRandom = await DogsInformation().getDogsRandom();
//   return dogRandom;
// });
// final dogsInformationProvider = Provider<DogsInformation>((ref) => DogsInformation());

final dogRandomProvider =
    StateNotifierProvider<DogRandomNotifier, DogImageRandomModel>((ref) {
  return DogRandomNotifier();
});
 
class DogRandomNotifier extends StateNotifier<DogImageRandomModel> {
  DogRandomNotifier() : super(DogImageRandomModel());

  Future<void> updateDogImage() async {
    try {
      final dogRandom = await DogsInformation().getDogsRandom();
      state = dogRandom;
    } catch (error) {
      ('Error al obtener imagen de perro aleatoria: $error');
    }
  }
}
