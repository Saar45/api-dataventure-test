# Documentation de l'API dataventure-test

Cette API est hébergée à distance sur un serveur web accessible publiquement.  
**URL de base distante** : `https://siomende.fr/sarr/api-dataventure-test/`

Vous pouvez donc accéder à l'API depuis n'importe quel client HTTP (navigateur, Postman, curl, etc.) sans avoir besoin d'un environnement local.

## Technologies utilisées

- **PHP** : Langage principal du backend.
- **CodeIgniter** : Framework PHP utilisé pour la structure du projet et la gestion des routes.
- **Eloquent ORM (Laravel)** : Utilisé pour l'accès et la manipulation de la base de données via le modèle `Users`.
- **MySQL** : Système de gestion de base de données relationnelle, hébergé sur [freesqldatabase.com](https://www.freesqldatabase.com/).
  - La base de données distante permet à l'API d'être totalement opérationnelle en ligne, sans dépendance à une base locale.

## Endpoints

**BASE URL** : `https://siomende.fr/sarr/api-dataventure-test/`


### 1. Récupérer tous les utilisateurs

- **URL** : `/users`
- **Méthode** : `GET`
- **Réponse** :  
  - `200 OK`  
    ```json
    [
      {
        "id": 1,
        "name": "Nom",
        "email": "email@example.com",
        "phone": "0123456789",
        "..."
      },
      ...
    ]
    ```

---

### 2. Créer un utilisateur

- **URL** : `/user`
- **Méthode** : `POST`
- **Body (x-www-form-urlencoded ou JSON)** :
  - `name` (requis)
  - `email` (requis)
  - `phone` (requis)
- **Réponse** :
  - `201 Created`  
    ```json
    {
      "id": 2,
      "name": "Nom",
      "email": "email@example.com",
      "phone": "0123456789",
      "created_at": "...",
      "updated_at": "..."
    }
    ```
  - `400 Bad Request`  
    ```json
    { "error": "Des informations sont manquantes" }
    ```

---

### 3. Modifier un utilisateur

- **URL** : `/user/{id}`
- **Méthode** : `PUT`
- **Body (JSON)** :
  - `name` (optionnel)
  - `email` (optionnel)
  - `phone` (optionnel)
- **Réponse** :
  - `200 OK`  
    ```json
    { "message": "Utilisateur modifié avec succès" }
    ```
  - `400 Bad Request`  
    ```json
    { "error": "Aucune donnée à mettre à jour" }
    ```
  - `404 Not Found`  
    ```json
    { "error": "Utilisateur introuvable" }
    ```

---

### 4. Supprimer un utilisateur

- **URL** : `/user/{id}`
- **Méthode** : `DELETE`
- **Réponse** :
  - `200 OK`  
    ```json
    { "Succes": true }
    ```
  - `404 Not Found`  
    ```json
    { "error": "Utilisateur introuvable" }
    ```

---

## Tâche planifiée (cron job)

Pour automatiser la récupération des utilisateurs inscrits la veille, un endpoint API dédié a été mis en place :

### GET `/api/usersyesterday`

Cet endpoint renvoie la liste des utilisateurs dont la date d'inscription (`created_at`) correspond à la veille de la date actuelle.

#### Exemple de réponse :
```json
[
  {
    "id": 5,
    "name": "Alice",
    "email": "alice@example.com",
    "phone": "0600000001",
    "created_at": "2024-06-22 10:00:00",
  },
  ...
]
```

### Utilisation dans une tâche cron

#### Exemple de ligne cron :
```bash
0 8 * * * curl -s https://siomende.fr/sarr/api-dataventure-test/api/users/yesterday >> /var/log/users_yesterday.log
```
Cette commande enverra la liste des utilisateurs inscrits la veille dans le fichier `/var/log/users_yesterday.log` chaque matin à 8h.

---

## Exemple de requêtes

### GET tous les utilisateurs

```bash
curl -X GET https://siomende.fr/sarr/api-dataventure-test/api/users
```

### POST créer un utilisateur

```bash
curl -X POST http://localhost/api-dataventure-test/api/users \
  -d "name=Jean Dupont" -d "email=jean@example.com" -d "phone=0600000000"
```

### PUT modifier un utilisateur

```bash
curl -X PUT http://localhost/api-dataventure-test/api/users/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Nouveau Nom"}'
```

### DELETE supprimer un utilisateur

```bash
curl -X DELETE http://localhost/api-dataventure-test/api/users/20
```
