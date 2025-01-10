// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String email;
  final String firstName;
  final String lastName;
  final String role;

  const ProfileScreen({
    Key? key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil de l\'Utilisateur'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Action de déconnexion
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Pour rendre la page réactive
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // En-tête du profil avec image et nom
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  children: [
                    // Icône ou image de profil
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blueGrey,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    // Informations personnelles
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$firstName $lastName',
                          style: Theme.of(context).textTheme.titleLarge, // Remplacé headline6 par titleLarge
                        ),
                        Text(
                          email,
                          style: Theme.of(context).textTheme.bodyLarge, // Remplacé pour un style plus adapté
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              // Liste des informations du profil avec style
              Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person, color: Colors.blue),
                      title: const Text('Nom'),
                      subtitle: Text('$firstName $lastName'),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.email, color: Colors.blue),
                      title: const Text('Email'),
                      subtitle: Text(email),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.security, color: Colors.blue),
                      title: const Text('Rôle'),
                      subtitle: Text(role),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              // Bouton de déconnexion
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // Déconnexion en retournant à l'écran de connexion
                  Navigator.pop(context);
                },
                child: const Text('Se déconnecter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
