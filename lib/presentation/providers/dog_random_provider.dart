import 'package:dog_api_riverpod/service/Services/dogs_information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/models/dog_img_random_model.dart';



final dogRandomProvider =
    StateNotifierProvider<DogRandomNotifier, DogRandomState>((ref) {
  return DogRandomNotifier();
});

class DogRandomNotifier extends StateNotifier<DogRandomState> {
  DogRandomNotifier() : super(DogRandomState()) {
    updateDogImage();
  }

  Future<void> updateDogImage() async {
    state = state.copyWith(isLoading: true);

    try {
      final dogRandom = await DogsInformation().getDogsRandom();
      state = state.copyWith(dog: dogRandom, isLoading: false);
    } catch (error) {
      ('Error al obtener imagen de perro aleatoria: $error');
    }
  }
}

class DogRandomState {
  final DogImageRandomModel? dog;
  final bool isLoading;

  DogRandomState({
    this.dog,
    this.isLoading = false,
  });

  DogRandomState copyWith({
    DogImageRandomModel? dog,
    bool? isLoading,
  }) =>
      DogRandomState(
        dog: dog ?? this.dog,
        isLoading: isLoading ?? this.isLoading,
      );
}
