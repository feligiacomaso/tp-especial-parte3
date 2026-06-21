<?php
require_once __DIR__ . '/libs/router/router.php';
require_once __DIR__ . '/app/controller/comentario-api.controller.php';
require_once __DIR__ . '/app/controller/auth-api.controller.php';
require_once __DIR__ . '/libs/jwt/jwt.middleware.php';

$router = new Router();
$router->addMiddleware(new JWTMiddleware());
$router->addRoute('auth/login','POST','AuthApiController','login');
$router->addRoute('comentarios', 'GET', 'ComentarioApiController', 'getComentarios');
$router->addRoute('comentarios/:id', 'GET', 'ComentarioApiController', 'getComentarioById');
$router->addRoute('comentarios', 'POST', 'ComentarioApiController', 'insertComentario');
$router->addRoute('comentarios/:id', 'PUT', 'ComentarioApiController', 'updateComentario');
// Ruta por defecto
$router->setDefaultRoute('ComentarioApiController', 'notFound');

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);

