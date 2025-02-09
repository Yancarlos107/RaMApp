import 'package:flutter/material.dart';
import '../../../domain/entities/location.dart';

class LocationListTile extends StatelessWidget {
  final Location location;

  const LocationListTile({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(location.name),
      subtitle: Text('${location.type} - ${location.dimension}'),
      onTap: () {
        Navigator.pushNamed(context, '/location_detail', arguments: location);
      },
    );
  }
}
