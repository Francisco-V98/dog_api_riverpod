import 'package:dog_api_riverpod/service/Services/dogs_information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/models/dog_img_random_model.dart';

final dogNameProvider = FutureProvider<List<String>>((ref) async {
  final dogName = await DogsInformation().getDogsName();
  return dogName;
});

final dogRandomProvider = FutureProvider.autoDispose<DogImageRandomModel>((ref) async {
  final dogRandom = await DogsInformation().getDogsRandom();
  return dogRandom;
});

final specificDogRandomProvider = FutureProvider.autoDispose.family<DogImageRandomModel, String>((ref, name) async {
  final dogRandom = await DogsInformation().getSpecificDogRandom(name);
  return dogRandom;
});