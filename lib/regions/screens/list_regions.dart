import 'package:api_colombia/regions/data/model/region_response.dart';
import 'package:api_colombia/regions/data/repository.dart';
import 'package:api_colombia/regions/screens/description_region.dart';
import 'package:flutter/material.dart';

class ListRegions extends StatelessWidget {
  const ListRegions({super.key});

  @override
  Widget build(BuildContext context) {
    final RegionsRepository repository = RegionsRepository();

    return Scaffold(
      appBar: AppBar(title: Text("Regiones")),
      body: FutureBuilder<List<RegionResponse>>(
        future: repository.fetchRegions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay regiones disponibles'));
          }

          final regions = snapshot.data!;

          return ListView.builder(
            itemCount: regions.length,
            itemBuilder: (context, index) {
              final region = regions[index];
              return ListTile(
                title: Text(region.name),
                subtitle: Text(
                  region.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DescriptionRegion(region: region),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
