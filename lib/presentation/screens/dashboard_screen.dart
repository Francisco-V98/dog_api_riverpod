import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista De Accion'), centerTitle: true),
      body: const _DashboardScreenView(),
    );
  }
}

class _DashboardScreenView extends StatelessWidget {
  const _DashboardScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [

        _CustomListTile(
          title: 'Lista De Perros',
          subTitle: 'Todas las razas de perros',
          location: '/dogsList',
        ),
        Divider(),
        _CustomListTile(
          title: 'Perro Aleatorio',
          subTitle: 'Ten una foto random de perros',
          location: '/randomImage',
        ),

      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}
