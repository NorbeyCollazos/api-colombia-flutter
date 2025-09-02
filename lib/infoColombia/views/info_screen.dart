import 'package:api_colombia/infoColombia/models/info_response.dart';
import 'package:api_colombia/infoColombia/viewmodels/info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<InfoViewModel>(context, listen: false).fetchInfo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final infoViewModel = Provider.of<InfoViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Información de Colombia")),
      body: infoViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : infoViewModel.errorMessage != null
          ? Center(child: Text(infoViewModel.errorMessage!))
          : infoViewModel.infoResponse != null
          ? viewInfo(infoViewModel.infoResponse!)
          : const Center(child: Text('No hay información disponible')),
    );
  }

  SingleChildScrollView viewInfo(InfoResponse infoResponse) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            infoResponse.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              infoResponse.flags,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment(0, -0.6),
            ),
          ),

          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              infoResponse.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
