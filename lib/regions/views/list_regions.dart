import 'package:api_colombia/regions/models/region_response.dart';
import 'package:api_colombia/regions/viewmodels/regions_view_model.dart';
import 'package:api_colombia/regions/views/description_region.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListRegions extends StatefulWidget {
  const ListRegions({super.key});

  @override
  State<ListRegions> createState() => _ListRegionsState();
}

class _ListRegionsState extends State<ListRegions> {

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<RegionsViewModel>(context, listen: false).getRegions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final viewModel = Provider.of<RegionsViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Regiones")),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.errorMessage != null
          ? Center(child: Text('Error: ${viewModel.errorMessage}'))
          : viewModel.regions.isEmpty
          ? const Center(child: Text('No hay regiones disponibles'))
          : regionsList(viewModel.regions),
    );
  }

  Padding regionsList(List<RegionResponse> regions) {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: regions.length,
            itemBuilder: (context, index) {
              final region = regions[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      leading: Hero(
                        tag: region.id,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assets/images/icono_regiones.jpg',
                          ),
                          backgroundColor: const Color.fromARGB(0, 238, 238, 238),
                        ),
                      ),
                      title: Text(region.name),
                      
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionRegion(region: region),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
  }
}
