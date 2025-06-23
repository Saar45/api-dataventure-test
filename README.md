# Documentation de l'API Utilisateurs

Cette API permet de gérer les utilisateurs avec les opérations CRUD (Créer, Lire, Mettre à jour, Supprimer).

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

- **URL** : `/users`
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

- **URL** : `/users/{id}`
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

- **URL** : `/users/{id}`
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
