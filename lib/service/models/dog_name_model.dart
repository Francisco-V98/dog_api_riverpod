

class DogNameModel {
  final String name;

  DogNameModel({required this.name});

  factory DogNameModel.fromJson(String name) {
    return DogNameModel(
      name: name,
    );
  }
}