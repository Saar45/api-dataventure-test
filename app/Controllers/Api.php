<?php

namespace App\Controllers;

use App\Models\Users;

class Api extends BaseController
{
  // GET /users
  public function getUsers()
  {
    $users = Users::all();
    return $this->response->setJSON($users);
  }

  // POST /users
  public function postUser()
  {
    $name = $this->request->getVar('name');
    $email = $this->request->getVar('email');
    $phone = $this->request->getVar('phone');

    if (!$name || !$email || !$phone) {
      return $this->response->setStatusCode(400)->setJSON(['error' => 'Des informations sont manquantes']);
    }

    try {
      $user = new Users();
      $user->name = $name;
      $user->email = $email;
      $user->phone = $phone;
      $user->save();

      return $this->response->setStatusCode(201)->setJSON($user);
    } catch (\Exception $e) {
      return $this->response->setStatusCode(400)->setJSON(['error' => $e->getMessage()]);
    }
  }

  // PUT /users/{id}
  public function putUser($id)
  {
    $data = $this->request->getRawInput();
    $name = $data['name'] ?? null;
    $email = $data['email'] ?? null;
    $phone = $data['phone'] ?? null;

    if (!$id) {
      return $this->response->setStatusCode(400)->setJSON(['error' => 'ID de l\'utilisateur manquant']);
    }

    $user = Users::find($id);

    if (!$user) {
      return $this->response->setStatusCode(404)->setJSON(['error' => 'Utilisateur introuvable']);
    }

    // Vérifier qu'au moins un champ est fourni
    if ($name === null && $email === null && $phone === null) {
      return $this->response->setStatusCode(400)->setJSON(['error' => 'Aucune donnée à mettre à jour']);
    }

    if ($name !== null) $user->name = $name;
    if ($email !== null) $user->email = $email;
    if ($phone !== null) $user->phone = $phone;

    $result = $user->save();
    if (!$result) {
      return $this->response->setStatusCode(400)->setJSON(['error' => 'Échec de la mise à jour de l\'utilisateur']);
    } else {
      return $this->response->setStatusCode(200)->setJSON(['message' => 'Utilisateur modifié avec succès']);
    }
  }

  // DELETE /users/{id}
  public function deleteUser($id)
  {
    $user = Users::find($id);
    if (!$user) {
      return $this->response->setStatusCode(404)->setJSON(['error' => 'Utilisateur introuvable']);
    }
    $user->delete();
    return $this->response->setJSON(['Succes' => true]);
  }
}
   // return $this->response->setJSON(['success' => true]);
