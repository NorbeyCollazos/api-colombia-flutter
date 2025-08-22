import 'package:api_colombia/infoColombia/screens/info_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _homeCard(
                icon: Icons.info,
                title: 'Información General de Colombia',
                description: 'Accede a datos completos sobre Colombia, incluyendo su capital, superficie, población, idiomas, y más.',
                colorCard: const Color.fromARGB(255, 184, 215, 255),
                colorIcon: const Color.fromARGB(255, 0, 63, 145),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen()));
                },
              ),
          
              _homeCard(
                icon: Icons.stroller,
                title: 'Departamentos',
                description: 'Directorio completo de departamentos, revelando la geografía única de Colombia.',
                colorCard: const Color.fromARGB(255, 255, 238, 187),
                colorIcon: const Color.fromARGB(255, 153, 115, 0),
                onPressed: () {
                  // Acción
                },
              ),
              _homeCard(
                icon: Icons.place_sharp,
                title: 'Regiones',
                description: 'Explora las regiones de Colombia, cada una con su encanto y particularidades, listas para ser descubiertas.',
                colorCard: const Color.fromARGB(255, 184, 215, 255),
                colorIcon: const Color.fromARGB(255, 0, 63, 145),
                onPressed: () {
                  // Acción
                },
              ),
              _homeCard(
                icon: Icons.beach_access,
                title: 'Atracciones Turísticas',
                description: 'Maravillosas atracciones turísticas que Colombia tiene para ofrecer, desde museos hasta parques naturales.',
                colorCard: const Color.fromARGB(255, 255, 238, 187),
                colorIcon: const Color.fromARGB(255, 153, 115, 0),
                onPressed: () {
                  // Acción
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeCard({
    required IconData icon,
    required String title,
    required String description,
    required Color colorCard, 
    required Color colorIcon, 
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity, 
      child: Card(
        elevation: 5,
        color: colorCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: colorIcon,),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text('Ver Información'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}