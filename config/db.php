<?Php

Class Database{
    public static function connect(){
        $db = new mysqli('localhost', 'root', '', 'ferr_ros_h');
        $db->query("SET NAMES 'utf8'");
        return $db;
    }
}

?>