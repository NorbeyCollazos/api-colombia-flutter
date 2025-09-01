import 'package:api_colombia/infoColombia/data/model/info_response.dart';
import 'package:api_colombia/infoColombia/data/repository.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InfoRepository repository = InfoRepository();

    return Scaffold(
      appBar: AppBar(title: Text("Información de Colombia"),),
      body: FutureBuilder<InfoResponse?>(
        future: repository.fetchInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No hay información disponible'));
          }

          final infoResponse = snapshot.data;
          if (infoResponse == null) {
            return const Center(child: Text('Información no encontrada'));
          }
          
          return SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  infoResponse.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Ajusta el radio según lo que necesites
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
        },
      ),
    );
  }
}
