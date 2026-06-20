<?php
require_once __DIR__ . '/../model/users.model.php';
require_once __DIR__ . '/../../libs/jwt/jwt.php';
class AuthApiController{
    private $model;
    public function __construct(){
        $this->model = new UsersModel();
    }
    public function login($request, $response){
        $email = $request -> body->email ?? null;
        $password = $request -> body->password ?? null;
        if(empty($email) || empty ($password)){
            return $response->json('falta completar datos', 400);
        }
        $user = $this->model->getByEmail($email);
        if(!$user){
            return $response->json('Usuario o contrasena incorrectos',401);
        }
        if(!password_verify($password,$user->password)){
            return $response ->json('Usuario o contrasena incorrectos', 401);
        }
        $payload= ['id' => $user->id_user, 'email' => $user-> email, 'exp'=> time()+3600];
        $token = createJWT($payload);
        return $response->json(['token'=> $token],200);
    }
}