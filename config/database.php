<?php

class dataBase {

    public $conn = null;

    public function __construct($server, $user, $password, $db) {
        try {
            $this->conn = new PDO("mysql:host=$server;dbname=$db", $user, $password);
            // set the PDO error mode to exception
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo $e->getMessage();
            die;
        }
    }

    // Select Query Function //
    public function selectAll($table_name, $where = null, $limit = null, $orderBy = null) {
        $sql = 'SELECT * FROM ' . $table_name;
        if (!empty($where)) {
            $sql .= ' where ';
            $i = 1;
            foreach ($where as $key => $val) {
                if (is_array($val)) {
                    foreach ($val as $key1 => $val1) {
                        $sql .= "$key1 $val1 and ";
                    }
                } else {
                    $sql .= "$key='$val' and ";
                }
            }
            $sql = trim($sql, ' and ');
        }
        if (!empty($orderBy)) {
            $sql .= " ORDER BY " . $orderBy['field'] . " " . $orderBy['order'];
        }

        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        // set the resulting array to associative
        $count = $stmt->rowCount();

        if (!empty($limit)) {
            $sql .= " LIMIT " . $limit;
        }
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();

        // set the resulting array to associative
        $result = $stmt->fetchAll(PDO::FETCH_OBJ);

        return array('count' => $count, 'result' => $result);
    }

}
