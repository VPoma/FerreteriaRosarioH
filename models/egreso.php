<?php

Class egreso{
    private $id;
    private $id_tienda;
    private $id_usuario;
    private $descripcion;
    private $tipopago;
    private $monto;
    private $fecha;
    private $hora;
    private $turno;
    private $est;
    //variables extra
    private $limite;
    private $offset;
    //
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

    function getTipopago(){
        return $this->tipopago;
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
    //variables extra
    function getLimite(){
        return $this->limite;
    }

    function getOffset(){
        return $this->offset;
    }
    //
    function setId($id){
        $this->id = $id;
    }

    function setId_tienda($id_tienda){
        $this->id_tienda = $id_tienda;
    }

    function setId_usuario($id_usuario){
        $this->id_usuario = $id_usuario;
    }

    function setDescripcion($descripcion){
        $this->descripcion = $this->db->real_escape_string($descripcion);
    }

    function setTipopago($tipopago){
        $this->tipopago = $this->db->real_escape_string($tipopago);
    }

    function setMonto($monto){
        $this->monto = $monto;
    }

    function setFecha($fecha){
        $this->fecha = $fecha;
    }

    function setHora($hora){
        $this->hora = $hora;
    }

    function setTurno($turno){
        $this->turno = $this->db->real_escape_string($turno);
    }

    function setEst($est){
        $this->est = $this->db->real_escape_string($est);
    }
    //variables extra
    function setLimite($limite){
        $this->limite = $limite;
    }

    function setOffset($offset){
        $this->offset = $offset;
    }
    //

    //Consutas
    //Guardar Registro de Egresos - 1Egreso
    public function save(){
        $sql = "INSERT INTO egreso VALUES(NULL, {$this->getId_tienda()}, {$this->getId_usuario()}, '{$this->getDescripcion()}', '{$this->getTipopago()}', {$this->getMonto()}, CURDATE(), CURRENT_TIME(), '{$this->getTurno()}', 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Muestra todos los registros de Egreso - 2Egreso
    Public function getall(){
        $sql = "SELECT e.id, e.descripcion, e.monto, e.fecha, e.turno, e.tipopago, t.nombre as 'tienda', u.usuariof as 'usuario' FROM egreso e "
                . "INNER JOIN tienda t on t.id = e.id_tienda "
                . "INNER JOIN usuario u on u.id = e.id_usuario "
                . "WHERE e.est = 'H' ORDER BY id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $egreso = $this->db->query($sql);
        return $egreso;
    }

    //Busca un solo registro de egreso a travez de id - 3Egreso
    public function getOne(){
        $sql = "SELECT e.id, e.descripcion, e.monto, e.fecha, e.turno, e.tipopago, t.nombre as 'tienda', u.usuariof as 'usuario' FROM egreso e "
                . "INNER JOIN tienda t on t.id = e.id_tienda "
                . "INNER JOIN usuario u on u.id = e.id_usuario "
                . "WHERE e.id = {$this->getId()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Editar registro de egreso - 4Egreso
    public function edit(){
        $sql = "UPDATE egreso SET descripcion = '{$this->getDescripcion()}', tipopago = '{$this->getTipopago()}', monto = {$this->getMonto()} WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Editar A fin de Ocultar - 5Egreso
    public function edit_oculta(){
        $sql = "UPDATE egreso SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Saca la cantidad de lineas - 6egreso
    public function getAlltotal(){
        $egreso  = $this->db->query("SELECT * FROM egreso WHERE est = 'H'");
        return $egreso->num_rows;
    }

    //Muestra registros de Egreso para Arqueo - 7Egreso
    Public function getall_Are(){
        $sql = "SELECT e.id, e.descripcion, e.monto, e.fecha, e.turno, e.tipopago, t.nombre as 'tienda', u.usuariof as 'usuario' FROM egreso e "
                . "INNER JOIN tienda t on t.id = e.id_tienda "
                . "INNER JOIN usuario u on u.id = e.id_usuario "
                . "WHERE e.fecha = '{$this->getFecha()}' AND e.turno = '{$this->getTurno()}' AND e.est = 'H' ORDER BY id DESC;";
        $egreso = $this->db->query($sql);
        return $egreso;
    }

    //Muestra el monto de los registros en efectivo de Egreso para Arqueo - 8Egreso
    Public function getall_Are_eg_ef(){
        $sql = "SELECT monto FROM egreso "
                . "WHERE tipopago = 'EFECTIVO' AND fecha = '{$this->getFecha()}' AND turno = '{$this->getTurno()}' AND est = 'H' ORDER BY id DESC;";
        $egreso = $this->db->query($sql);
        return $egreso;
    }

    //Muestra el monto de los registros en transferencia de Egreso para Arqueo - 9Egreso
    Public function getall_Are_eg_tr(){
        $sql = "SELECT monto FROM egreso "
                . "WHERE tipopago != 'EFECTIVO' AND fecha = '{$this->getFecha()}' AND turno = '{$this->getTurno()}' AND est = 'H' ORDER BY id DESC;";
        $egreso = $this->db->query($sql);
        return $egreso;
    }

}

?>