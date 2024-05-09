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

    if (dogRandom.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (dogRandom.dog == null) {
      return const Center(child: Text('Error al cargar la imagen del perro.'));
    }

    return Column(
      children: [
        SizedBox(
            height: 400,
            width: double.infinity,
            child: Image.network(dogRandom.dog!.urlImage!, fit: BoxFit.cover)),
        const SizedBox(height: 32),
        Text(
          dogRandom.dog!.nameDog!.replaceAll('-', ' '),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.indigo),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          onPressed: () {
            ref.read(dogRandomProvider.notifier).updateDogImage();
          },
          child: const Text('Obtener otro perro'),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
