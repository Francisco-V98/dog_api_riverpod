import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class RandomImageScreen extends StatelessWidget {
  const RandomImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perro aleatorio'),
        centerTitle: true,
      ),
      body: const _RandomImageScreenView(),
    );
  }
}

class _RandomImageScreenView extends ConsumerWidget {
  const _RandomImageScreenView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dogRandom = ref.watch(dogRandomProvider);

    // if (dogRandom.urlImage D& dogRandom.nameDog  null ) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    return Column(
      children: [
        SizedBox(
          height: 400,
          width: double.infinity,
          child: dogRandom.urlImage != null
              ? Image.network(dogRandom.urlImage!, fit: BoxFit.cover)
              : const Center(child: Text('No se pudo cargar la imagen del perro')),
        ),
        const SizedBox(height: 32),
        Text(
          dogRandom.nameDog != null
              ? dogRandom.nameDog!.replaceAll('-', ' ')
              : '...',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
