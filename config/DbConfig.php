<?php

include_once 'autoload.php';
/*
  | -------------------------------------------------------------------
  | DATABASE CONNECTIVITY SETTINGS
  | -------------------------------------------------------------------
  | This file will contain the settings needed to access your database.
 * 
 */

class DbConfig {

    private $_host = 'localhost';
    private $_username = 'root';
    private $_password = '';
    private $_database = 'spyprice';
    protected $connection;

    public function __construct() {
        if (!isset($this->connection)) {
            try {
                $this->connection = new PDO("mysql:host=$this->_host;dbname=$this->_database", $this->_username, $this->_password);
                $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e) {
                echo $e->getMessage();
                exit;
            }
        }
    }

}

?>
