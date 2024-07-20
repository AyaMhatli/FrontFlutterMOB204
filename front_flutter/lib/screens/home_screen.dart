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
  String userName = '';
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
    _fetchUserName();
  }

  Future<void> _fetchData() async {
    try {
      final numero = await ApiService.fetchNumeroActuelle();
      final traites = await ApiService.fetchAppelTraites();
      final nonTraites = await ApiService.fetchAppelNonTraites();
    print('Fetched numero: $numero');
    print('Fetched traites: $traites');
    print('Fetched nonTraites: $nonTraites');
      setState(() {
        numeroActuelle = numero;
        appelTraites = traites;
        appelNonTraites = nonTraites;
      });
    } catch (e) {
          print('Error fetching data: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de chargement des données: $e')),
      );
    }
  }

  Future<void> _fetchUserName() async {
    try {
      final user = await ApiService.getAuthenticatedUser();
      setState(() {
        userName = user['name'];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de chargement du nom d\'utilisateur: $e')),
      );
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
            Text(
              'Bonjour $userName',
              style: const TextStyle(
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
            const SizedBox(height: 8),
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
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              child: SizedBox(
                width: 500,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button action here
                    print('Bouton pressé');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 234, 228, 228),
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
              padding: const EdgeInsets.only(top: 15.0, left: 40.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Numéro actuel',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 0.0),
                  Expanded(
                    child: Text(
                      '$numeroActuelle',
                      style: const TextStyle(
                        fontSize: 85.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 40.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '$appelNonTraites',
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(width: 0.0),
                  Expanded(
                    child: Text(
                      '$appelTraites',
                      style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'tickets en attente',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 0.0),
                  Expanded(
                    child: Text(
                      'tickets Traités',
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 0.0),
                Container(
                  margin: const EdgeInsets.only(top: 15.0, right: 10.0, left: 20.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 130,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your first button action here
                            print('Premier bouton pressé');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 240, 233, 233),
                            backgroundColor: const Color.fromARGB(255, 216, 91, 91),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
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
                      const SizedBox(width: 60),
                      SizedBox(
                        width: 130,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your second button action here
                            print('Deuxième bouton pressé');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 240, 233, 233),
                            backgroundColor: const Color.fromARGB(255, 216, 91, 91),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
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
        selectedItemColor: const Color.fromARGB(97, 57, 51, 68),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
