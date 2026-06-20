<?php
require_once __DIR__ . '/config.php';
class ComentarioModel {
   private $db;

    public function __construct() {
        $this->db = new PDO(
            'mysql:host='.MYSQL_HOST.
            ';dbname='.MYSQL_DB.
            ';charset=utf8',
            MYSQL_USER,
            MYSQL_PASS
            );
    }
   public function getAll() {
      // 2. prepara y ejecuta la consulta
      $query = $this->db->prepare('SELECT * FROM comentario_album');
      $query->execute();

      // 3. obtiene los resultados
      return $query->fetchAll(PDO::FETCH_OBJ);
   }
   public function getAllByAlbum($id_album) {
      $query = $this->db->prepare(
         'SELECT * FROM comentario_album WHERE id_album = ?'
      );
      $query->execute([$id_album]);
      return $query->fetchAll(PDO::FETCH_OBJ);
   }
   public function getAllOrdered($sort,$order){
     $query= $this->db->prepare("SELECT * FROM comentario_album
     ORDER BY $sort $order");
     $query->execute();
     return $query->fetchAll(PDO::FETCH_OBJ);
   }  
   public function get($id) {
      $query = $this->db->prepare('SELECT * FROM comentario_album WHERE id_comentario = ?');
      $query->execute([$id]);
      return $query->fetch(PDO::FETCH_OBJ);
   }
   public function insert($autor, $comentario, $fecha, $id_album) {
      $query = $this->db->prepare('
        INSERT INTO comentario_album
        (autor, comentario, fecha, id_album)
        VALUES (?, ?, ?, ?)');
      $query->execute([$autor,$comentario,$fecha,$id_album]);
      return $this->db->lastInsertId();
   }
   public function update($id, $autor, $comentario, $fecha, $id_album) {
      $query = $this->db->prepare('UPDATE comentario_album SET autor = ?,
         comentario = ?,fecha = ?,id_album = ? WHERE id_comentario = ?');
      $query->execute([$autor,$comentario,$fecha,$id_album,$id]);
   }
   public function getAllPaginated($limit, $offset) {
      $query = $this->db->prepare(
        'SELECT * FROM comentario_album
        LIMIT ? OFFSET ?');
      $query->bindValue(1, $limit, PDO::PARAM_INT);
      $query->bindValue(2, $offset, PDO::PARAM_INT);
      $query->execute();
      return $query->fetchAll(PDO::FETCH_OBJ);
}
}
