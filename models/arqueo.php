<?php

class Arqueo{
    private $id;
    private $id_usuario;
    private $totalingresoe;
    private $totalingresot;
    private $totalegresoe;
    private $totalegresot;
    private $totaldeuda;
    private $totalefectivo;
    private $totaltransfer;
    private $fechaar;
    private $turno;
    private $fecha;
    private $hora;
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

    function getId_Usuario(){
        return $this->id_usuario;
    }

    function getTotalingresoe(){
        return $this->totalingresoe;
    }

    function getTotalingresot(){
        return $this->totalingresot;
    }

    function getTotalegresoe(){
        return $this->totalegresoe;
    }

    function getTotalegresot(){
        return $this->totalegresot;
    }
    
    function getTotaldeuda(){
        return $this->totaldeuda;
    }

    function getTotalefectivo(){
        return $this->totalefectivo;
    }

    function getTotaltransfer(){
        return $this->totaltransfer;
    }

    function getFechaar(){
        return $this->fechaar;
    }

    function getTurno(){
        return $this->turno;
    }

    function getFecha(){
        return $this->fecha;
    }

    function getHora(){
        return $this->hora;
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

    //
    function setId($id){
        $this->id = $id;
    }

    function setId_Usuario($id_usuario){
        $this->id_usuario = $id_usuario;
    }

    function setTotalingresoe($totalingresoe){
        $this->totalingresoe = $totalingresoe;
    }

    function setTotalingresot($totalingresot){
        $this->totalingresot = $totalingresot;
    }

    function setTotalegresoe($totalegresoe){
        $this->totalegresoe = $totalegresoe;
    }

    function setTotalegresot($totalegresot){
        $this->totalegresot = $totalegresot;
    }

    function setTotaldeuda($totaldeuda){
        $this->totaldeuda = $totaldeuda;
    }

    function setTotalefectivo($totalefectivo){
        $this->totalefectivo = $totalefectivo;
    }

    function setTotaltransfer($totaltransfer){
        $this->totaltransfer = $totaltransfer;
    }

    function setFechaar($fechaar){
        $this->fechaar = $fechaar;
    }

    function setTurno($turno){
        $this->turno = $turno;
    }

    function setFecha($fecha){
        $this->fecha = $fecha;
    }

    function setHora($hora){
        $this->hora = $hora;
    }

    function setEst($est){
        $this->est = $est;
    }

    //variables extra
    function setLimite($limite){
        $this->limite = $limite;
    }

    function setOffset($offset){
        $this->offset = $offset;
    }
    //

    //Consultas
    
    //Guardar Registro Arqueo - 1arqueo
    public function save(){
        $sql = "INSERT INTO arqueo VALUES(NULL, {$this->getId_Usuario()}, {$this->getTotalingresoe()}, {$this->getTotalingresot()}, {$this->getTotalegresoe()}, {$this->getTotalegresot()}, {$this->getTotaldeuda()}, {$this->getTotalefectivo()}, {$this->getTotaltransfer()}, '{$this->getFechaar()}', '{$this->getTurno()}', CURDATE(), CURRENT_TIME(), 'H');";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Muestra todos los registros - 2arqueo
    public function getAll(){
        $sql = "SELECT ar.*, u.usuariof as 'usuario' FROM arqueo ar "
                ."INNER JOIN usuario u ON ar.id_usuario = u.id "
                ."WHERE ar.est = 'H' ORDER BY id DESC;";
        $arqueo = $this->db->query($sql);
        return $arqueo;
    }

    //Muestra la cantidad de todos los registros - 3arqueo
    public function getAlltotal(){
        $producto  = $this->db->query("SELECT * FROM arqueo WHERE est = 'H'");
        return $producto->num_rows;
    }

    //Muestra el registro de arqueo a partir de un id - 4arqueo
    public function getOne(){
        $sql = "SELECT ar.*, u.usuariof as 'usuario' FROM arqueo ar "
                ."INNER JOIN usuario u ON ar.id_usuario = u.id "
                ."WHERE ar.id = {$this->getId()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Edita para olcutar registro- 5arqueo
    public function edit_oculta(){
        $sql = "UPDATE arqueo SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

}

?>