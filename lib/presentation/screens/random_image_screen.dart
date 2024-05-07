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

    return dogRandom.when(
      data: (data) {
        return Column(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              // color: Colors.red,
              child: Image.network(data.urlImage, fit: BoxFit.cover),
            ),
            const SizedBox(height: 32),
            Text(
              data.nameDog.replaceAll('-', ' '),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => const Text('No se pudo cargar el nombre'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
