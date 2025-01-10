Pour installer les dépendances du projet veuillez exécuter la commande:

- npm install

Pour lancer le serveur:

- npm run start


Les utilisateurs:

Pour renseigner un nouvel utilisateur vous pouvez utlisez la route '/register' avec en paramètres: 
    - email
    - password(hasher)
    - firstName
    - lastName
    - role

Pour vous connecter vous pouvez utilisez la route '/login' avec en paramètres:
    - email
    - password(hasher)


Un utilisateur test existe déjà:
    - email: test@test.com
    - password: testtest