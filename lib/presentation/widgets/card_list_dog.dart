import 'package:flutter/material.dart';

class CardListDog extends StatelessWidget {
  final String image;
  final String name;
  const CardListDog({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                color: Colors.red,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.1, 0.4],
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                left: 0,
                right: 0,
                child: SizedBox(
                  child: Center(
                    child: Text(
                      name.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
