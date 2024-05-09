import 'package:dog_api_riverpod/service/Services/dogs_information.dart';
import 'package:dog_api_riverpod/service/models/dog_img_random_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/models/dog_name_model.dart';

final specificDogRandomProvider = FutureProvider.autoDispose
    .family<DogImageRandomModel, String>((ref, name) async {
  final dogRandom = await DogsInformation().getSpecificDogRandom(name);
  return dogRandom;
});

// final dogNameProvider = FutureProvider<List<String>>((ref) async {
//   final dogName = await DogsInformation().getDogsName();
//   return dogName;
// });

final dogNamePictureProvider =
    StateNotifierProvider<DogNamePictureNotifier, DogState>((ref) {
  return DogNamePictureNotifier();
});

class DogNamePictureNotifier extends StateNotifier<DogState> {
  DogNamePictureNotifier() : super(DogState()) {
    getDogNamePicture();
  }

  Future<void> getDogNamePicture() async {
    state = state.copyWith(isLoading: true);

    try {
      final dogName = await DogsInformation().getDogsName();


      state = state.copyWith(dogName: dogName);
    } catch (error) {
      ('Error al obtener imagen de perro aleatoria: $error');
    }
  }
}

class DogState {
  final DogImageRandomModel? dogImage;
  final DogNameModel? dogName;
  final bool isLoading;

  DogState({
    this.dogImage,
    this.dogName,
    this.isLoading = false,
  });

  DogState copyWith({
    DogImageRandomModel? dogImage,
    DogNameModel? dogName,
    bool? isLoading,
  }) =>
      DogState(
        dogImage: dogImage ?? this.dogImage,
        dogName: dogName ?? this.dogName,
        isLoading: isLoading ?? this.isLoading,
      );
}
