<?php
require_once __DIR__ . '/../model/comentario.model.php';
require_once __DIR__ . '/../model/album.model.php';
class ComentarioApiController {
    private $model;
    private $albumModel;
    public function __construct(){
        $this->model = new ComentarioModel();
        $this->albumModel = new AlbumModel();
    }

    public function getComentarios($request, $response){
        $id_album = $request->query->id_album ?? null;
        $sort = $request->query->sort ?? null;
        $order = strtolower($request->query->order ?? 'asc');
        $page = $request->query->page ?? null;
        $limit = $request->query->limit ?? null;
        if ($id_album) {
            $album = $this -> albumModel -> get($id_album);
            if(!$album){
                return $response->json("el album con id=$id_album no existe",404);
            }
            $comentarios = $this->model->getAllByAlbum($id_album);
            return $response->json($comentarios, 200);
        }
       if($sort){
            $allowedSorts = ['id_comentario','autor','comentario','fecha','id_album'];
            if(!in_array($sort, $allowedSorts)){
                return $response->json('campo de ordenamiento invalido',400);
            }
            if($order !='asc' && $order !='desc'){
                return $response->json('orden invalido', 400);
            }
            $comentarios = $this->model->getAllOrdered($sort,$order);
            return $response->json($comentarios,200);
        }
        if($page !== null && $limit !== null){
            if($page < 1 || $limit < 1){
                return $response->json('parametros de paginacion invalidos', 400);
            }
            $offset = ($page - 1) * $limit;
            $comentarios = $this->model->getAllPaginated($limit,$offset);
            return $response->json($comentarios, 200);
        }
        $comentarios = $this->model->getAll();
        return $response->json($comentarios, 200);

    }

    public function getComentarioById($request, $response){
        $id_comentario = $request->params->id;
        $comentario = $this->model->get($id_comentario);
        if(!$comentario){
            return $response->json(
                "El comentario con id = $id_comentario no existe", 
                404
            );
        }
        return $response->json($comentario,200);
    }

    public function insertComentario($request, $response){
        if (!$request->user) {
            return $response->json('No autorizado',401);
        }
        $autor = $request->body->autor ?? null;
        $comentario = $request->body->comentario ?? null;
        $fecha = $request->body->fecha ?? null;
        $id_album = $request->body->id_album ?? null;

        if (empty($autor) || empty($comentario) || empty($fecha) || empty($id_album)) {
            return $response->json('Falta completar datos', 400);
        }
        $album = $this->albumModel->get($id_album);
        if (!$album) {
            return $response->json(
                "El álbum con id=$id_album no existe",
                404
            );
        }
        $id = $this->model->insert( $autor,$comentario,$fecha,$id_album);
        if (!$id) {
            return $response->json('Error al insertar', 500);
        }
        $comentarioCreado = $this->model->get($id);
        return $response->json($comentarioCreado, 201);
    }

    public function updateComentario($request, $response) {
        if(!$request->user) {
            return $response->json('No autorizado',401);
        }
        $id_comentario = $request->params->id;
        $comentario = $this->model->get($id_comentario);
        if (!$comentario) {
            return $response->json("El comentario con id=$id_comentario no existe",404);
        }
        $autor = $request->body->autor ?? null;
        $comentarioTexto = $request->body->comentario ?? null;
        $fecha = $request->body->fecha ?? null;
        $id_album = $request->body->id_album ?? null;
    
        if (empty($autor) || empty($comentarioTexto) || empty($fecha) || empty($id_album)) {
            return $response->json('Falta completar datos',400);
        }
        $album = $this->albumModel->get($id_album);
        if (!$album) {
            return $response->json("El álbum con id=$id_album no existe",404);
        }
        $this->model->update($id_comentario,$autor,$comentarioTexto,$fecha,$id_album);
        $comentarioActualizado = $this->model->get($id_comentario);
        return $response->json($comentarioActualizado,200);
    }

    public function notFound($request, $response) {
        return $response->json('Endpoint no encontrado',404);
    }
}