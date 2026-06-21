<?php
require_once __DIR__ . '/config.php';
class UsersModel {
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
      $query = $this->db->prepare('SELECT * FROM users');
      $query->execute();

      // 3. obtiene los resultados
      return $query->fetchAll(PDO::FETCH_OBJ);
   }

   public function get($id) {
      $query = $this->db->prepare('SELECT * FROM users WHERE id_user = ?');
      $query->execute([$id]);

      return $query->fetch(PDO::FETCH_OBJ);
   }

   public function getByEmail($email) {
      $query = $this->db->prepare('SELECT * FROM users WHERE email = ?');
      $query->execute([$email]);

      return $query->fetch(PDO::FETCH_OBJ);
   }

}
