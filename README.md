
# Projet d'Application de Connexion (Flutter + Node.js)

Ce projet consiste en une application mobile développée avec **Flutter** et une API RESTful développée avec **Node.js** pour gérer l'authentification des utilisateurs.

## Structure du Projet

### Frontend (Flutter)
L'application Flutter permet aux utilisateurs de se connecter en utilisant leur email et mot de passe. Une fois connectés, les utilisateurs sont redirigés vers une page de profil où leurs informations sont affichées.

- **LoginScreen** : Page de connexion où l'utilisateur entre son email et mot de passe.
- **ProfileScreen** : Page de profil qui affiche les informations de l'utilisateur après une connexion réussie.

### Backend (Node.js)
L'API est construite avec **Express** et permet de gérer les utilisateurs, incluant l'enregistrement et la connexion. Les mots de passe sont hachés pour garantir la sécurité des informations sensibles.

- **Enregistrement** : Enregistrement d'un nouvel utilisateur avec email, mot de passe, prénom, nom, et rôle.
- **Connexion** : Vérification des informations de connexion avec comparaison du mot de passe haché.

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés sur votre machine :

- **Flutter** 
- **Node.js** 
- **npm** 
- **Visual Studio Code** 

## Installation et Configuration

### 1. Configuration du Backend (API)

1. Installez les dépendances nécessaires avec `npm` :
   ```bash
   npm install
   ```

2. Démarrez le serveur de l'API :
   ```bash
   node app.js
   ```

3. L'API sera maintenant accessible sur `http://localhost:3000`.

### 2. Configuration du Frontend (Flutter)

1. Installez les dépendances Flutter :
   ```bash
   flutter pub get
   ```

2. Exécutez l'application Flutter :
   ```bash
   flutter run
   ```
   
## Fonctionnalités

- **Connexion de l'utilisateur** : L'utilisateur peut se connecter en utilisant son email et son mot de passe.
- **Affichage des informations du profil** : Après la connexion, les informations du profil de l'utilisateur sont affichées sur une nouvelle page (prénom, nom, rôle, email).
- **Sécurité** : Les mots de passe sont hachés avant d'être stockés dans le fichier.

## Routes de l'API

### Enregistrement d'un utilisateur

- **Méthode** : `POST`
- **URL** : `http://localhost:3000/register`
- **Corps de la requête** :
  ```json
  {
    "email": "test@test.com",
    "password": "testtest",
    "firstName": "test",
    "lastName": "test",
    "role": "admin"
  }
  ```

### Connexion d'un utilisateur

- **Méthode** : `POST`
- **URL** : `http://localhost:3000/login`
- **Corps de la requête** :
  ```json
  {
    "email": "test@test.com",
    "password": "testtest"
  }
  ```

## Technologies Utilisées

- **Frontend** :
  - Flutter (Dart)
  - Material Design pour l'interface utilisateur

- **Backend** :
  - Node.js
  - Express.js
  - `fs` pour la gestion des fichiers
  - `cors` pour autoriser les requêtes croisées (CORS)

## Sécurité

Les mots de passe des utilisateurs sont hachés avant d'être stockés.
