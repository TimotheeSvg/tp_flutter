import 'package:flutter/material.dart';
import '../services/auth_service.dart'; // Importez AuthService
import 'profile_screen.dart'; // Importez ProfileScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Clé pour le formulaire
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService(); // Instanciation d'AuthService

  bool _isLoading = false; // État de chargement

  // Méthode de connexion
  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      final user = await _authService.login(email, password);
      setState(() {
        _isLoading = false;
      });

      if (user != null) {
        // Connexion réussie avec informations supplémentaires
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(
              email: email,
              firstName: user['firstName'],
              lastName: user['lastName'],
              role: user['role'],
            ),
          ),
        );
      } else {
        // Connexion échouée
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Erreur'),
            content: const Text('Email ou mot de passe incorrect'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        color: Colors.grey[100], // Fond grisé
        child: Center( // Centrage du formulaire
          child: SingleChildScrollView( // Ajout de SingleChildScrollView pour la réactivité
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox( // Ajout d'une contrainte pour réduire la taille du formulaire
                constraints: BoxConstraints(maxWidth: 400),
                child: Container(
                  padding: const EdgeInsets.all(16.0), // Espacement interne
                  decoration: BoxDecoration(
                    color: Colors.white, // Fond blanc pour le formulaire
                    borderRadius: BorderRadius.circular(12), // Bordures arrondies
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.4), // Bordure grise
                      width: 1.5, // Épaisseur de la bordure
                    ),
                  ),
                  child: Form(
                    key: _formKey, // Assignation de la clé au formulaire
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch, // Alignement sur toute la largeur
                      children: <Widget>[
                        // Champ Email
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.mail),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            // Validation de l'email
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre email';
                            }
                            // Regex simple pour valider l'email
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Veuillez entrer un email valide';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        // Champ Mot de Passe
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Mot de passe',
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.lock),
                          ),
                          obscureText: true, // Masquer le texte
                          validator: (value) {
                            // Validation du mot de passe
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre mot de passe';
                            }
                            if (value.length < 6) {
                              return 'Le mot de passe doit contenir au moins 6 caractères';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        // Bouton de Connexion ou Indicateur de Chargement
                        _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                          ),
                          onPressed: _login,
                          child: const Text('Se connecter'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
