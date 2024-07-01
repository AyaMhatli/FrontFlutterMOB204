import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:front_flutter/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late String today;
  int numeroActuelle = 0;
  int appelTraites = 0;
  int appelNonTraites = 0;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null).then((_) {
      setState(() {
        today = DateFormat.yMMMMEEEEd('fr_FR').format(DateTime.now());
      });
    });
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final numero = await ApiService.fetchNumeroActuelle();
      final traites = await ApiService.fetchAppelTraites();
      final nonTraites = await ApiService.fetchAppelNonTraites();
      setState(() {
        numeroActuelle = numero;
        appelTraites = traites;
        appelNonTraites = nonTraites;
      });
    } catch (e) {
      // Afficher un message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur de chargement des données: $e')));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.pushNamed(context, '/edit-profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 65.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Bonjour Aya',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              today,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8), // Espacement entre la date et le texte suivant
            Container(
              margin: const EdgeInsets.fromLTRB(50.0, 40.0, 0.0, 0.0),
              child: const Text(
                'Consultation: guichet1',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10), // Espacement entre le texte et le bouton
            Container(
              margin: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              child: SizedBox(
                width: 500, // Largeur du bouton
                height: 80, // Hauteur du bouton
                child: ElevatedButton(
                  onPressed: () {
                    // Ajoutez ici l'action du bouton
                    print('Bouton pressé');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 234, 228, 228), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'APPELER',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 0.0, left: 40.0, bottom: 0.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Numéro actuel',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 0.0), // Espacement entre les deux textes
                      Expanded(
                        child: Text(
                          '$numeroActuelle',
                          style: TextStyle(
                            fontSize: 85.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 0.0, left: 40.0, bottom: 0.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '$appelNonTraites',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(width: 0.0), // Espacement entre les deux textes
                      Expanded(
                        child: Text(
                          '119',
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0), // Espacement entre le texte et le bouton
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 0.0, left: 0.0, bottom: 0.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'tickets en attente  ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 0.0), // Espacement entre les deux textes
                      Expanded(
                        child: Text(
                          'tickets Traités',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 0.0), // Espacement entre le texte et les boutons
                Container(
                  margin: const EdgeInsets.only(top: 15.0, right: 10.0, left: 20.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 130, // Largeur du premier bouton
                        height: 60, // Hauteur du premier bouton
                        child: ElevatedButton(
                          onPressed: () {
                            // Ajoutez ici l'action du premier bouton
                            print('Premier bouton pressé');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 240, 233, 233), // Couleur du texte du premier bouton
                            backgroundColor: Color.fromARGB(255, 216, 91, 91), // Couleur de fond du premier bouton
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0), // Arrondissement des coins du premier bouton
                            ),
                          ),
                          child: const Text(
                            'Qualifier',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 60), // Espacement entre les deux boutons
                      SizedBox(
                        width: 130, // Largeur du deuxième bouton
                        height: 60, // Hauteur du deuxième bouton
                        child: ElevatedButton(
                          onPressed: () {
                            // Ajoutez ici l'action du deuxième bouton
                            print('Deuxième bouton pressé');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 240, 233, 233), // Couleur du texte du deuxième bouton
                            backgroundColor: Color.fromARGB(255, 216, 91, 91), // Couleur de fond du deuxième bouton
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0), // Arrondissement des coins du deuxième bouton
                            ),
                          ),
                          child: const Text(
                            'Rappeler',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Ajoutez ici votre autre contenu si nécessaire
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Actions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Déconnexion',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(97, 57, 51, 68),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
