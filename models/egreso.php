<?php

Class egreso{
    private $id;
    private $id_tienda;
    private $id_usuario;
    private $descripcion;
    private $monto;
    private $fecha;
    private $hora;
    private $turno;
    private $est;
    private $db;

    public function __construct(){
        $this->db = Database::connect();
    }

    function getId(){
        return $this->id;
    }

    function getId_tienda(){
        return $this->id_tienda;
    }

    function getId_usuario(){
        return $this->id_usuario;
    }

    function getDescripcion(){
        return $this->descripcion;
    }

    function getMonto(){
        return $this->monto;
    }

    function getFecha(){
        return $this->fecha;
    }

    function getHora(){
        return $this->hora;
    }

    function getTurno(){
        return $this->turno;
    }

    function getEst(){
        return $this->est;
    }

    function setId($id){
        $this->id = $id;
    }

    function setId_tienda($id_tienda){
        $this->id_tienda = $id_tienda;
    }

    function setId_usuario($id_usuario){
        $this->id_usuario = $id_usuario;
    }

    function setdescripcion($descripcion){
        $this->descripcion = $this->db->real_escape_string($descripcion);
    }

    function setMonto($monto){
        $this->monto = $monto;
    }

    function setFecha($fecha){
        $this->fecha = $fecha;
    }

    function sethora($hora){
        $this->hora = $hora;
    }

    function setTurno($turno){
        $this->turno = $this->db->real_escape_string($turno);
    }

    function setEst($est){
        $this->est = $this->db->real_escape_string($est);
    }

    //Consutas

    //Guardar Registro de Productos - 4producto
    public function save(){
        $sql = "INSERT INTO egreso VALUES(NULL, {$this->getId_tienda()}, {$this->getId_usuario()}, '{$this->getDescripcion()}', {$this->getMonto()}, CURDATE(), CURRENT_TIME(), '{$this->getTurno()}', 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }



    //
}

?>