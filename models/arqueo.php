<?php

class Arqueo{
    private $id;
    private $id_usuario;
    private $montoinicialc;
    private $totalingresoe;
    private $totalingresot;
    private $totalegresoe;
    private $totalegresot;
    private $totaldeuda;
    private $totalefectivo;
    private $totaltransfer;
    private $totalcaja;
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

    function getId_Usuario(){
        return $this->id_usuario;
    }

    function getMontoinicialc(){
        return $this->montoinicialc;
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

    function getTotalcaja(){
        return $this->totalcaja;
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

    //
    function setId($id){
        $this->id = $id;
    }

    function setId_Usuario($id_usuario){
        $this->id_usuario = $id_usuario;
    }

    function setMontoinicialc($montoinicialc){
        $this->montoinicialc = $montoinicialc;
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

    function setTotalcaja($totalcaja){
        $this->totalcaja = $totalcaja;
    }

    function setFecha($fecha){
        $this->fecha = $fecha;
    }

    function setHora($hora){
        $this->hora = $hora;
    }

    function setTurno($turno){
        $this->turno = $turno;
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
        $sql = "INSERT INTO arqueo VALUES(NULL, {$this->getId_Usuario()}, {$this->getMontoinicialc()}, {$this->getTotalingresoe()}, {$this->getTotalingresot()}, {$this->getTotalegresoe()}, {$this->getTotalegresot()}, {$this->getTotaldeuda()}, {$this->getTotalefectivo()}, {$this->getTotaltransfer()}, {$this->getTotalcaja()}, CURDATE(), CURRENT_TIME(), '{$this->getTurno()}', 'H');";
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
                ." ORDER BY id DESC;";
        $arqueo = $this->db->query($sql);
        return $arqueo;
    }

    //Muestra la cantidad de todos los registros - 3arqueo
    public function getAlltotal(){
        $producto  = $this->db->query("SELECT * FROM arqueo WHERE est = 'H'");
        return $producto->num_rows;
    }

}

?>