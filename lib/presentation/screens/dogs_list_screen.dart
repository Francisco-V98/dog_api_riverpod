import 'package:dog_api_riverpod/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/widgets.dart';

class DogsListScreen extends StatelessWidget {
  const DogsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Perros'),
        centerTitle: true,
      ),
      body: const _DogsListView(),
    );
  }
}

class _DogsListView extends ConsumerWidget {
  const _DogsListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listDogs = ref.watch(dogNameProvider);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: listDogs.when(
        data: (data) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: data.length,
                  (context, index) {
                    return CardListDog(
                      name: data[index],
                      image:
                          'https://images.dog.ceo/breeds/affenpinscher/n02110627_8048.jpg',
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
              )
            ],
          );
        },
        error: (error, stackTrace) => const Text('No se pudo cargar el nombre'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
