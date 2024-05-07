class DogImageRandomModel {
  final String? urlImage;
  final String? nameDog;

  DogImageRandomModel({
    this.nameDog,
    this.urlImage,
  });

  factory DogImageRandomModel.fromJson(Map<String, dynamic> json) {
    final String url = json["message"];

    String withoutPrefix =
        url.replaceFirst("https://images.dog.ceo/breeds/", "");
    String withoutSuffix = withoutPrefix.split("/").first;

    return DogImageRandomModel(nameDog: withoutSuffix, urlImage: url);
  }

  Map<String, dynamic> toJson() => {"message": urlImage};

  DogImageRandomModel copyWith({
    String? nameDog,
    String? urlImage,
  }) {
    return DogImageRandomModel(
      nameDog: nameDog ?? this.nameDog,
      urlImage: urlImage ?? this.urlImage,
    );
  }
}
