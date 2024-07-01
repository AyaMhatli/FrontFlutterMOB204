import 'package:flutter/material.dart';

class ServerScreen extends StatefulWidget {
  @override
  _ServerScreenState createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  final TextEditingController _urlController = TextEditingController();

  void _login() {
    // Logique de connexion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Centre le titre
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left:26.0, right: 26.0, bottom:0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Étire les éléments horizontalement
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), // Rayon de bordure pour arrondir les coins
                  child: Image.asset(
                    'lib/assets/logo_login.png',
                    height: 90, // Ajustez la taille selon vos besoins
                    width: 90,  // Ajustez la taille selon vos besoins
                    fit: BoxFit.cover, // Assurez-vous que l'image remplit la zone
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Accés Serveur',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 13),
                const Text(
                  'Your first Step',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 148, 145, 145),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'URL SERVEUR',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 158, 152, 152),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Bordures arrondies
                ), // Ajoute une bordure au champ de texte
                filled: true, // Remplit le champ de texte
                fillColor: Color.fromARGB(255, 255, 252, 252), // Change la couleur de fond
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 218, 64, 64), // Couleu de fond du bouton
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Réduit le padding vertical
                textStyle: const TextStyle(
                  fontSize: 14, // Réduit la taille de la police
                  fontWeight: FontWeight.bold,
                ),
                minimumSize: Size(120, 36), // Ajuste la largeur et la hauteur minimale du bouton
              ),
              child: const Text(
                'Demande Accés',
                style: TextStyle(
                  color: Colors.white, // Couleur du texte du bouton
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


